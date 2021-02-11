class HomesController < ApplicationController
  def top
    @q = PostRamen.ransack(params[:q])
    @tags = ActsAsTaggableOn::Tag.all
    # @post_ramens = @q.result
    # @post_ramens = @search_value.result(distinct: true)
  end
end
