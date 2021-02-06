class ShopsController < ApplicationController
  def index
  end

  def show
  end

  def create
    @shop = Shop.new
    @shop.save
    @post_ramen = PostRamen.find(params[:id])
    redirect_to post_ramen(post_ramen)
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :address, :latitude, :longitude, post_ramen_attributes: [
      :id, :title, :content, :review, :image, :user_id])
  end
end
