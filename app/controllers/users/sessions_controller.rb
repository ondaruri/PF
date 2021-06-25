class Users::SessionsController < Devise::SessionsController

  def new_guest
    user = User.guest
    sign_in user   # ユーザーをログインさせる
    redirect_to homes_index_path, notice: 'ゲストユーザーとしてログインしました。'
  end


  protected

  def reject_user
    @user = User.find_by(email: params[:user][:email].downcase)
    if @user
      if @user.valid_password?(params[:user][:password]) && (@user.active_for_authentication? == false)
        flash[:notice] = "退会済みです。"
        redirect_to root_path
      else
        flash[:notice] = "項目を入力してください"
      end
    end
  end
end