class UsersController < ApplicationController
before_action :baria_user, only: [:edit, :update]

  def show
    @current_user = current_user
    @user = User.find(params[:id])
    @q = PostRamen.ransack(params[:q]) #サイドバー
    @tags = ActsAsTaggableOn::Tag.all #サイドバー
    @post_ramens = @user.post_ramens.order("created_at DESC")
    @post_ramen_randoms = PostRamen.order("RAND").limit(5)

    @current_user_entry = Entry.where(user_id: current_user.id)
    @user_entry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @current_user_entry.each do |cu|
        @user_entry.each do |u|
          if cu.room_id == u.room_id
            @isRoom = true
            @room_id = cu.room_id
          end
        end
      end
    end
    if @isRoom
    else
      @room = Room.new
      @entry = Entry.new
    end
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
