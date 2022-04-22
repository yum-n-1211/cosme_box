class HomesController < ApplicationController
  def top
    @post_reviews = PostReview.order("created_at DESC").page(params[:page])
  end

  def about
  end
end
