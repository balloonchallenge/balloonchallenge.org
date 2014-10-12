class TeamsController < ApplicationController

  before_action :correct_team, only: [:destroy, :update, :edit]
  def create
    @team = Team.new(team_params)
    if @team.save
      flash[:success] = "Team created!"
      current_user.team_id = @team.id
      current_user.save
      redirect_to root_url
    end
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
  end

  def show
    @team = Team.find(params[:id])
  end

  private

    def team_params
      params.require(:team).permit(:name, :location, :description)
    end

    def correct_team
      @team = current_user.team
      redirect_to root_url if @team.nil?
    end

end
