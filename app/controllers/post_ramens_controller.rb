class PostRamensController < ApplicationController

  def index
    # byebug
    if params[:format] #タグクリック時の検索
      @post_ramens = PostRamen.tagged_with(params[:format])
    elsif params[:q].present? #フリーワード検索
      @search = PostRamen.ransack(params[:q])
      @post_ramens = @search.result
    elsif params[:acts_as_taggable_on_tag]{[:name][:search_method]}.present?
      if  params[:acts_as_taggable_on_tag][:search_method] == "AND"
        @post_ramens = PostRamen.tagged_with(params[:acts_as_taggable_on_tag][:name], :match_all => true) #and検索
      elsif  params[:acts_as_taggable_on_tag][:search_method] == "OR"
         @post_ramens = PostRamen.tagged_with(params[:acts_as_taggable_on_tag][:name], :any => true) #or検索
      end
    # elsif params[:acts_as_taggable_on_tag][:name].present? #タグチェックBOX検索時
    #   # if  @post_ramens = PostRamen.tagged_with(params[:acts_as_taggable_on_tag][:name], :match_all => true) #and検索
    #   @post_ramens = PostRamen.tagged_with(params[:acts_as_taggable_on_tag][:name], :any => true) #or検索
    else
      @post_ramens = PostRamen.all
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
            :shop_name, :address, :image, :user_id, :search_method, :tag, tag_list:[] )
  end
end
