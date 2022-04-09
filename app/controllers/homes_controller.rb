class HomesController < ApplicationController
  def top
    @posts = Post.page(params[:page])
  end

  def about
  end
end
