class TeamsController < ApplicationController

  before_action :correct_team, only: [:destroy, :update, :edit]
  before_action :no_team, only: [:add]
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
 
  def add
    if @team.save
      flash[:success] = "User added!"
      redirect_to @team
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
