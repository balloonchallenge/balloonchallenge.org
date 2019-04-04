class TeamsController < ApplicationController

  before_action :correct_team, only: [:destroy, :update, :edit, :add_member, :remove_member]
  before_action :is_admin, only: [:admin, :admin_members_csv]

  def create
    @user = current_user
    @team = Team.create(team_params)
    @user.team = @team
    if @team.save
      @user.save
      TeamMailer.new_team(@user, @team).deliver
      @team.update_attributes(:signed_up_2019 => true)
      flash[:success] = "Team created!"
      redirect_to @team
    else
      flash[:alert] = "Team creation failed"
      redirect_to teams_url
    end
  end

  def update
    if @team.update(team_params)
      flash[:success] = "Team updated!"
      redirect_to @team
    else
      flash[:alert] = "Team not updated"
      render :edit
    end
  end

  def edit
    @team = Team.find(params[:id])

  end

  def index
    # @teams = Team.where(signed_up_2016: true).order('name ASC')
    @teams = Team.order('name ASC')
    @country_count = Team.all.distinct.count('country_code')
  end

  def destroy
    @team.destroy
    redirect_to teams_url
  end

  def show
    @team = Team.find(params[:id])
    @request = Request.new
    @request_ids = []
    # this is a total hack because I'm meh at rails
    # We'll check if the current_user's ID is in this array in the view
    # to not present the button if the user has already requested to join
    @team.requests.each do |request|
      @request_ids << request.user_id
    end
  end

  def admin
    @teams = Team.order('created_at ASC')
    @extra_users = User.where(team: nil)
    @all_users = User.order('created_at ASC')
    # 2016 lets go hype squad

    # @education_outreach = AttachedAsset.where(category: 'Best Education Outreach Initiative').where(["created_at > ?", Time.new(2016, 1, 1, 0, 0, 0)]).order('team_id ASC')
    # @photo = AttachedAsset.where(category: 'Best Photograph').where(["created_at > ?", Time.new(2016, 1, 1, 0, 0, 0)]).order('team_id ASC')
    # @science = AttachedAsset.where(category: 'Best Science Experiment').where(["created_at > ?", Time.new(2016, 1, 1, 0, 0, 0)]).order('team_id ASC')
    # @design = AttachedAsset.where(category: 'Best Design').where(["created_at > ?", Time.new(2016, 1, 1, 0, 0, 0)]).order('team_id ASC')
    # @video = AttachedAsset.where(category: 'Best Video').where(["created_at > ?", Time.new(2016, 1, 1, 0, 0, 0)]).order('team_id ASC')
    # @charitable = AttachedAsset.where(category: 'Most Charitable Team').where(["created_at > ?", Time.new(2016, 1, 1, 0, 0, 0)]).order('team_id ASC')
    # @helpful = AttachedAsset.where(category: 'Most Helpful Team').where(["created_at > ?", Time.new(2016, 1, 1, 0, 0, 0)]).order('team_id ASC')
    # @ground = AttachedAsset.where(category: 'Longest Ground Track').where(["created_at > ?", Time.new(2016, 1, 1, 0, 0, 0)]).order('team_id ASC')
    # @return = AttachedAsset.where(category: 'Return To Launch Site').where(["created_at > ?", Time.new(2016, 1, 1, 0, 0, 0)]).order('team_id ASC')

    # 2019 categories (same as 2017)

    @education = AttachedAsset.where(category: 'Best Educational Initiative').where(["created_at > ?", Time.new(2019, 1, 1, 0, 0, 0)]).order('team_id ASC')
    @design    = AttachedAsset.where(category: 'Best Design').where(["created_at > ?", Time.new(2019, 1, 1, 0, 0, 0)]).order('team_id ASC')
    respond_to do |format|
      format.html
      format.csv { render text: @teams.to_csv }
    end
  end

  def admin_members_csv
  @all_users = User.order('created_at ASC').where(email_ignore: [false, nil])
   respond_to do |format|
      format.csv { render text: @all_users.to_csv }
    end
  end

  def add_member
    @team = Team.find(params[:id])
    @request_ids = []
    @team.requests.each do |request|
      @request_ids << request.user_id
    end
    @user = User.where(email: params[:email]).first
    if @user and @user.team.nil?
      @team.users << @user
      @team.save
      @user.save
      if @request_ids.include?(@user.id)
        Request.where(user_id: @user.id).destroy_all
      end
      TeamMailer.added_user(@user, @team).deliver
      flash[:success] = "Team updated!"
      redirect_to team_path(@team.id)
    elsif !@user
      flash[:alert] = "User does not exist!"
      redirect_to :back
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
      redirect_to :back
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

  def search
    @teams = Team.search params[:search]
  end

  def launch
    @teams = Team.where(signed_up_2019: true).where.not(launch_date: '').order('launch_date ASC')
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
        :url,
        :team_img,
        :launch_date,
        :signed_up_2015,
        :signed_up_2016,
        :signed_up_2017,
        :signed_up_2018,
        :signed_up_2019,
        :flew_2017,
        :flew_2016,
        :flew_2015,
        :flew_2014,
        attached_assets_attributes: [:id, :asset, :category, :_destroy]
      )
    end

    def user_params
    end

    def correct_team
      @team = current_user.team
      redirect_to root_url if @team.nil?
    end

    def is_admin
      redirect_to teams_path if !current_user or !current_user.admin
    end
end
