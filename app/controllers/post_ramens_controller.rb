class PostRamensController < ApplicationController

  def new
    @shop = Shop.new
    @shop.build_post_ramen
  end

  def create
    @post_ramen = PostRamen.new(post_ramen_params)
    @post_ramen.user_id = current_user.id
    @post_ramen.save
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
  end

  private

  def post_ramen_params
    params.require(:post_ramen).permit(:title, :content, :review, :image, :user_id)
  end
end
