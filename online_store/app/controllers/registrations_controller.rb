class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end

  protected

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_path # Redirect to the admin view
    else
      user_path # Redirect to the regular user view
    end
  end
end
