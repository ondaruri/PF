class PostRamensController < ApplicationController

  def index
    # byebug
    if params[:format]
      @post_ramens = PostRamen.tagged_with(params[:format])
    elsif @search = PostRamen.ransack(params[:q])
      @post_ramens = @search.result
    end
  end

  def new
    @post_ramen = PostRamen.new
    @tags = ActsAsTaggableOn::Tag.all
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
    @post_comment = PostComment.new
    gon.address = @post_ramen
    @tags = @post_ramen.tag_counts_on(:tags)
    # if params[:tag]
    #   @post_ramens = PostRamen.tagged_with(params[:tag])
    # end
  end

  def edit
  end

  def update
  end

  def destroy
    user = current_user
    PostRamen.find(params[:id]).destroy
    redirect_to user_path(user)
  end

  def search
  end

  private

  def post_ramen_params
    params.require(:post_ramen).permit(:title, :content, :review,
            :shop_name, :address, :image, :user_id, :tag, tag_list:[] )
  end
end
