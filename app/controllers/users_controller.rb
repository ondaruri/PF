class UsersController < ApplicationController
before_action :baria_user, only: [:edit, :update]

  def show
    @current_user = current_user
    @user = User.find(params[:id])
    @q = PostRamen.ransack(params[:q]) #サイドバー
    @tags = ActsAsTaggableOn::Tag.all #サイドバー
    @post_ramens = @user.post_ramens.order("created_at DESC")
    @post_ramen_randoms = PostRamen.order("RAND()").limit(5)
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render action: :edit
    end
  end

  def follower
    @user = User.find(params[:id])
    @current_user = current_user
  end

  def follows
    @user = User.find(params[:id])
    @current_user = current_user
  end

private

  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end

  def baria_user
    unless User.find(params[:id]) == current_user
      redirect_to root_path
    end
  end
end
