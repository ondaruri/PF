class HomesController < ApplicationController
  def top
    @q = PostRamen.ransack(params[:q])
    # @post_ramens = @q.result
    # @post_ramens = @search_value.result(distinct: true)
  end
end
