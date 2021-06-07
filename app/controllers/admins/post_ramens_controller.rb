class Admins::PostRamensController < ApplicationController
  def index
  end

  def show
    @post_ramen = PostRamen.find(params[:post_ramen_id])
    @post_ramen_tags = @post_ramen.tag_counts_on(:tags)
    @post_comments = @post_ramen.post_comments
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    post_ramen = PostRamen.find(params[:id])
    user = post_ramen.user_id
    PostRamen.find(params[:id]).destroy
    redirect_to admins_user_show_path(user), alert: "投稿を削除しました"
  end

  # private
  #   def post_ramen_params
  #     params.require(:post_ramen).permit(:id, :user_id, :post_ramen_id)
  #   end


end
