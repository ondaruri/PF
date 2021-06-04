class Admins::PostRamensController < ApplicationController
  def index
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    post_ramen = PostRamen.find(params[:post_ramen_id])
    user = post_ramen.user_id
    PostRamen.find(params[:post_ramen_id]).destroy
    redirect_to admins_users_show_path(user), alert: "投稿を削除しました"
  end

  # private
  #   def post_ramen_params
  #     params.require(:post_ramen).permit(:id, :user_id, :post_ramen_id)
  #   end


end
