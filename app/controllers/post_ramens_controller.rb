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
    else
      @post_ramens = PostRamen.all
    end

    @q = PostRamen.ransack(params[:q])  #rightサイドの変数↓↓
    @tags = ActsAsTaggableOn::Tag.all
    @post_ramen_all_ranks = PostRamen.create_all_ranks #いいね全期間ランキング
    @post_ramen_month_ranks = PostRamen.create_month_ranks #いいね週間ランキング
    @post_ramen_year_ranks = PostRamen.create_year_ranks
    @most_used_tags = ActsAsTaggableOn::Tag.most_used(10)
    now = Time.current
    @tonkothu_ranks = PostRamen.joins(:likes).tagged_with("とんこつ").where(likes: { created_at: now.beginning_of_month..now.end_of_month}).group(:id).order("count(post_ramen_id) desc").limit(10) #とんこつランキング
    @shio_ranks = PostRamen.joins(:likes).tagged_with("しお").where(likes: { created_at: now.beginning_of_month..now.end_of_month}).group(:id).order("count(post_ramen_id) desc").limit(10) #しおランキング
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
      redirect_to post_ramen_path(@post_ramen), notice: '新規投稿しました。'
    else
      redirect_to root_path
    end
  end

  def show
    @post_ramen = PostRamen.find(params[:id])
    @post_comment = PostComment.new
    gon.address = @post_ramen
    @post_ramen_tags = @post_ramen.tag_counts_on(:tags)
    @post_comments = PostComment.where(post_ramen_id: params[:id])
    @q = PostRamen.ransack(params[:q]) #サイドバー
    @tags = ActsAsTaggableOn::Tag.all #サイドバー
  end

  def edit
    @post_ramen = PostRamen.find(params[:id])
    @tags = ActsAsTaggableOn::Tag.all
  end

  def update
    post_ramen = PostRamen.find(params[:id])
    post_ramen.update(post_ramen_params)
    redirect_to post_ramen_path(post_ramen)
  end

  def destroy
    PostRamen.find(params[:id]).destroy
    redirect_to root_path, notice: "投稿を削除しました。"
  end

  def search
  end

  private

  def post_ramen_params
    params.require(:post_ramen).permit(:title, :content, :review,
            :shop_name, :address, :image, :user_id, :search_method, :tag, tag_list:[] )
  end
end
