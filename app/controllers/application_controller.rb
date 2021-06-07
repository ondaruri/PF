class ApplicationController < ActionController::Base
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!

  # def after_sign_out_path_for(resource)
  #   new_user_session_path # ログアウト後に遷移するpathを設定
  # end

  # def after_admins_sign_in_path_for(resource)
  #   admins_users_index_path
  # end　# adminログイン後に遷移するpathを設定

  def after_sign_in_path_for(resource)
    homes_index_path # userログイン後に遷移するpathを設定
  end

  def after_users_guest_sign_in_path_for(resource)
    homes_index_path # userログイン後に遷移するpathを設定
  end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end


# end