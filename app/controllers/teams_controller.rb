class TeamsController < ApplicationController
  def create
    @team = Team.new(team_params)
    if @team.save
      flash[:success] = "Team created!"
      redirect_to root_url
    end
  end

  def index
    @teams = Team.all
  end

  def destroy
    @team.destroy
  end

  private

    def team_params
      params.require(:team).permit(:location)
    end

end
