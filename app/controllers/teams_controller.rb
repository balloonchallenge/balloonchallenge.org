class TeamsController < ApplicationController

  before_action :correct_team, only: [:destroy, :update, :edit, :add_member, :remove_member]
  before_action :is_admin, only: [:admin]

  def create
    @user = current_user
    @team = Team.create(team_params)
    @user.team = @team
    if @team.save
      @user.save
      TeamMailer.new_team(@user, @team).deliver
      flash[:success] = "Team created!"
      redirect_to @team
    else
      flash[:alert] = "Team creation failed"
      redirect_to teams_url
    end
    # if @team.save
    #   flash[:success] = "Team created!"
    #   current_user.team_id = @team.id
    #   current_user.save
    #   redirect_to root_url
    # end
  end

  def update
    if @team.update(team_params)
      flash[:success] = "Team updated!"
      redirect_to @team
    else
      flash[:alert] = "Team not updated"
    end
  end

  def edit 
    @team = Team.find(params[:id])
  end

  def index
    @teams = Team.all
  end

  def destroy
    @team.destroy
    redirect_to teams_url
  end

  def show
    @team = Team.find(params[:id])
  end

  def admin
    @teams = Team.all
    @extra_users = User.where(team: nil)
  end
 
  def add_member
    @team = Team.find(params[:id])
    @user = User.where(email: params[:email]).first
    if @user and @user.team.nil?
      @team.users << @user
      @team.save
      @user.save
      TeamMailer.added_user(@user, @team).deliver
      flash[:success] = "Team updated!"
      redirect_to team_path(@team.id)
    elsif !@user.team.nil?
      flash[:alert] = "#{@user.first_name} is already in a team!"
      redirect_to :back
    else
      flash[:alert] = "Could not add user to team!"
      redirect_to :back
    end
  end

  def new
    @team = Team.new
  end

  def remove_member
    @user = User.find(params[:id])
    if @user and !@user.team.nil?
      @user.team = nil
      @user.save
      flash[:success] = "User removed from team"
      redirect_to team_path(Team.find(params[:id]))
    end
  end

  def thanks
    if current_user
      @team = current_user.team
    end
  end

  def subregion_options
    render partial: 'subregion_select'
  end

  def all_teams
    @teams = Team.all
    render json: @teams
  end
  private

    def team_params
      params.require(:team).permit(
        :name, 
        :school, 
        :description, 
        :city, :state_code, :country_code, 
        :why_join, 
        :plan, 
        :find_out, 
        :host_payload, :have_payload, :buddies_mentor, :buddies_mentee, 
        :ages_0_10, :ages_11_17, :ages_18_26, :ages_27_50, 
        :ages_50_up,
        :url
      )
    end

    def user_params
    end

    def correct_team
      @team = current_user.team
      redirect_to root_url if @team.nil?
    end

    def is_admin
      redirect_to teams_path if !current_user.admin
    end
end
