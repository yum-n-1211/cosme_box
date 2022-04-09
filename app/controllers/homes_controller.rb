class HomesController < ApplicationController
  def top
    @post_reviews = PostReview.page(params[:page])
  end

  def about
  end
end
