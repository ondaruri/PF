class PostRamensController < ApplicationController

  def new
    @post_ramen = PostRamen.new
    @shop = Shop.new
  end

  def create
    @post_ramen = PostRamen.new(post_ramen_params)
    @post_ramen.user_id = current_user.id
    @post_ramen.save
    redirect_to post_ramen_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @post_ramen = PostRamen.find(params[:id])
    @post_ramen.destroy
    redirect_to users_my_page_path
  end

  def search
  end

  private

  def post_ramen_params
    params.require(:post_ramen).permit(:title, :content, :review, :image, :user_id)
  end

end
