class ShopsController < ApplicationController
  def index
  end

  def show
  end

  def create

    # @shop = Shop.new(shop_params)
    # @post_ramen = PostRamen.new(post_ramen_params)
    @shop = Shop.new(shop_params)
    p @shop.build_post_ramen
    p shop_params
    @shop.save!
    # @post_ramen.save
    # @post_ramen = PostRamen(post_ramen_params)

    # @post_ramen = PostRamen.new(post_ramen_params)
    # @post_ramen.save
    redirect_to root_path
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :address, :latitude, :longitude, post_ramen_attributes: [
      :id, :title, :content, :review, :image, :user_id])
  end
end
