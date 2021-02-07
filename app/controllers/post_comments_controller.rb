class PostCommentsController < ApplicationController

  def new
  end

  def create
    post_ramen = PostRamen.find(params[:post_ramen_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_ramen_id = post_ramen.id
    comment.save
    redirect_to post_ramen_path(post_ramen)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:content)
  end
end
