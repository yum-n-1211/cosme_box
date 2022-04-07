class PostsController < ApplicationController

  def new
    @post = Post.new
    5.times {@post.post_reviews.build}
  end

  def create
    @post = Post.new(post_params)
    if @post.save #@post_form.valid?

      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
  end

  def index
  end

  def edit
  end

  def update
  end

  private

  def post_params
    params.require(:post)
    .permit(post_reviews_attributes:[:id, :item_name, :item_genre, :item_brand, :good_point, :image_id, :post_id, :star])
    .merge(user_id: current_user.id)
  end

end