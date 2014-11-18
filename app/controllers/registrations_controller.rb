class RegistrationsController < Devise::RegistrationsController
  protected

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :pastlaunch, :gsbc_last_year)
  end

  def account_update_params 
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :first_name, :last_name, :pastlaunch, :gsbc_last_year)
  end

  def after_sign_up_path_for(resource)
    edit_user_registration_path
  end
end
