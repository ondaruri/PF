class PostCommentsController < ApplicationController

  def new
  end

  def create
    @post_ramen = PostRamen.find(params[:post_ramen_id])
    @post_comments = @post_ramen.post_comments.order("created_at DESC")
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_ramen_id = @post_ramen.id
    comment.save
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @post_ramen = PostRamen.find(params[:post_ramen_id])
    @post_comments = @post_ramen.post_comments
    @post_comment = PostComment.find_by(id: params[:id], post_ramen_id: params[:post_ramen_id]).destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:content)
  end
end
