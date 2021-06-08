class Admins::UsersController < ApplicationController
   before_action :authenticate_admin!

  def index
    @users = User.all.order("created_at DESC")
  end

  def search
    @users = User.search(params[:search]).order("created_at DESC")
  end

  def edit
  end

  def show
     @user = User.find(params[:user_id])
     @post_ramens = @user.post_ramens.order("created_at DESC")
  end

  def update
  end

  def destroy
    @user = User.find(params[:user_id]).destroy
    redirect_to admins_users_index_path, alert: "ユーザーを削除しました"
  end

  # private
  #   def post_ramen_params
  #     params.require(:post_ramen).permit(:id, :user_id, :post_ramen_id)
  #   end

end
