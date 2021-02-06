class PostRamensController < ApplicationController

  def new
    @shop = Shop.new
    # @post_ramen = PostRamen.new
    @shop.build_post_ramen
  end

  def create
  end

  def show
    @post_ramens = PostRamen.all
    @shops = Shops.all
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
