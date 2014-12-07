class RequestsController < ApplicationController
  def create
    @user = current_user
    @request = Request.create(req_params)
    if @request.save
      @request.user_id = current_user.id
      @request.save
      RequestMailer.new_request(@user, @request.team)
      flash[:success] = "You have requested to join the team!"
      redirect_to :back
    else
      flash[:alert] = "Request failed"
      redirect_to :back
    end
  end

  def new
    @request = Request.new
  end
  
  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to :back
  end

  private

    def req_params
      params.require(:request).permit(
        :team_id
      )
    end
end
