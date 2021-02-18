class HomesController < ApplicationController
  def top
    @q = PostRamen.ransack(params[:q])
    @tags = ActsAsTaggableOn::Tag.all
    @post_ramens = PostRamen.all.order("created_at DESC")
    @post_ramen = PostRamen.page(params[:page]).all.per(3)
    # -----------------right--------------------------------
    @post_ramen_all_ranks = PostRamen.create_all_ranks
    @most_used_tags = ActsAsTaggableOn::Tag.most_used(5)
    
  end
end




