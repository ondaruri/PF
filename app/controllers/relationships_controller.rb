class RelationshipsController < ApplicationController

  def follow
    @user = User.find(params[:id])
    current_user.follow(params[:id])
    @follower = Relationship.find_by(params[:followed_id])
    # @follower = User.find(params[:followed_id])
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.unfollow(params[:id])
    @follower = Relationship.find_by(params[:followed_id])

    # @follower = User.find(params[:id])
  end
end
