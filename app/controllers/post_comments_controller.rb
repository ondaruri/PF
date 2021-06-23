class PostCommentsController < ApplicationController
 before_action :authenticate_user!
  def new
  end

  def create
    @post_ramen = PostRamen.find(params[:post_ramen_id])
    @post_comments = @post_ramen.post_comments.order("created_at DESC")
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_ramen_id = @post_ramen.id
    comment.save
    @post_ramen.create_notification_post_comment!(current_user, comment.id)
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

  def baria_user
    unless PostComment.find(params[:id]).user.id.to_i == current_user.id
        redirect_to root_path
    end
  end
end
