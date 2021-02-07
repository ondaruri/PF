class UsersController < ApplicationController

  def show
    @current_user = current_user
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
    # @user = User.find(params[:id])
  end

  def update
    @user = Use.fin(params[:id])
    if @user.update(user_params)
      redirect_to my_page_path
    else
      render action: :edit
    end
  end

  # def my_page
  #   @user = current_user
  # end

private

  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end
end
