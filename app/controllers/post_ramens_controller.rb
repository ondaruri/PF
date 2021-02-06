class PostRamensController < ApplicationController

  def new
    @post_ramen = PostRamen.new
  end

  def create
    @post_ramen = PostRamen.new(post_ramen_params)
    @post_ramen.user_id = current_user.id
    if
      @post_ramen.save!
      redirect_to post_ramen_path(@post_ramen)
    else
      redirect_to root_path
    end
  end

  def show
    @post_ramen = PostRamen.find(params[:id])
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
