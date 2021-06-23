class RelationshipsController < ApplicationController

  def follow
    @user = User.find(params[:id])
    current_user.follow(params[:id])
    @user.create_notification_follow!(current_user)
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.unfollow(params[:id])
  end
end
