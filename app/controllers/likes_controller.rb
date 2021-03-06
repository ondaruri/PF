class LikesController < ApplicationController

  def create
    @post_ramen= PostRamen.find(params[:post_ramen_id])
    like = current_user.likes.new(post_ramen_id: @post_ramen.id)
    like.save
  end

  def destroy
    @post_ramen = PostRamen.find(params[:post_ramen_id])
    like = current_user.likes.find_by(post_ramen_id: @post_ramen.id)
    like.destroy
  end
end
