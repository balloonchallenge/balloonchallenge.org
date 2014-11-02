class TeamsController < ApplicationController

  before_action :correct_team, only: [:destroy, :update, :edit, :add_member, :remove_member]

  def create
    @user = current_user
    @team = Team.create(team_params)
    @user.team = @team
    if @team.save
      @user.save
      flash[:success] = "Team created!"
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
      redirect_to teams_url
    else
      flash[:error] = "Team not updated"
    end
  end

  def edit 
  end

  def index
    @team = Team.new
    @teams = Team.all
  end

  def destroy
    @team.destroy
    redirect_to teams_url
  end

  def show
    @team = Team.find(params[:id])
  end
 
  def add_member
    @team = Team.find(params[:id])
    @user = User.where(email: params[:email]).first
    if @user and @user.team.nil?
      @team.users << @user
      @team.save
      @user.save
      flash[:success] = "Team updated!"
      redirect_to team_path(@team.id)
    else
      flash[:error] = "User has a team!"
      redirect_to root_url
    end
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

  def feed
    @title = "GSBC Teams"

    @teams = Team.order("updated_at desc")
    @updated = @teams.first.updated_at unless @teams.empty?
    
    respond_to do |format| 
      format.atom {render :layout => false }
      format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently}
    end
  end

  private

    def team_params
      params.require(:team).permit(:name, :location, :description)
    end

    def user_params
    end

    def correct_team
      @team = current_user.team
      redirect_to root_url if @team.nil?
    end
end
