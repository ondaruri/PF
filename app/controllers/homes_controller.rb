class HomesController < ApplicationController
  def top
    @q = PostRamen.ransack(params[:q])
    @tags = ActsAsTaggableOn::Tag.all
    @post_ramens = PostRamen.all.order("created_at DESC").page(params[:page]).per(20)
    # -----------------right--------------------------------
    @post_ramen_all_ranks = PostRamen.create_all_ranks #いいね全期間ランキング
    @post_ramen_month_ranks = PostRamen.create_month_ranks #いいね週間ランキング
    @post_ramen_year_ranks = PostRamen.create_year_ranks
    now = Time.current
    @most_used_tags = ActsAsTaggableOn::Tag.most_used(10).where(created_at: now.beginning_of_year..now.end_of_year) #タグ投稿数ランキング
    @tonkothu_ranks = PostRamen.joins(:likes).tagged_with("とんこつ").where(likes: { created_at: now.beginning_of_month..now.end_of_month}).group(:id).order("count(post_ramen_id) desc").limit(10) #とんこつランキング
    @shio_ranks = PostRamen.joins(:likes).tagged_with("しお").where(likes: { created_at: now.beginning_of_month..now.end_of_month}).group(:id).order("count(post_ramen_id) desc").limit(10) #しおランキング
  end
end




