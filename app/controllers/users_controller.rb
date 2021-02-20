class UsersController < ApplicationController

  def show
    @current_user = current_user
    @user = User.find(params[:id])
    @q = PostRamen.ransack(params[:q]) #サイドバー
    @tags = ActsAsTaggableOn::Tag.all #サイドバー
    @post_ramens = @user.post_ramens
  end

  def edit
    @user = current_user
    # @user = User.find(params[:id])
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
  end

  def follows
    @user = User.find(params[:id])
  end

  # def my_page
  #   @user = current_user
  # end

private

  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end
end
