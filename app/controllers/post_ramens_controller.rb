class PostRamensController < ApplicationController
  
  def new
    @post_ramen = PostRamen.new
  end

  def create
    @post_ramen = PostRamen.new(post_ramen_params)
    @post_ramen.user_id = current_user.id
    @post_ramen.save
    redirect_to post_ramen(ramen)
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
end
