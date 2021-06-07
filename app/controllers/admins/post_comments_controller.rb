class Admins::PostCommentsController < ApplicationController
  def destroy
    @post_comment = PostComment.find_by(params[:format]).destroy
    post_ramen = PostRamen.find(params[:post_ramen_id])
    redirect_to admins_post_ramen_show_path(post_ramen), alert: "コメントを削除しました"
  end
end
