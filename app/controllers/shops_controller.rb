class ShopsController < ApplicationController
  def index
  end

  def show
  end

  def shop_params
    params.require(:shop).permit(:name, :address, :latitude, :longitude, post_ramen_attributes: [
      :id, :title, :content, :review, :image, :user_id])
  end
end
