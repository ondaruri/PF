class Admins::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
  end

  def show
     @user = User.find(params[:format])
     @post_ramens = @user.post_ramens
  end

  def update
  end

  def destroy
    @user = User.find(params[:format]).destroy
    redirect_to admins_users_index_path, alert: "ユーザーを削除しました"
  end
end
