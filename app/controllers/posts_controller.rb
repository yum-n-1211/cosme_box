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
    @post = Post.find(params[:id])
    @post_reviews = @post.post_reviews
  end

  def index
    @post = Post.find_by(user_id: current_user.id)
    @post_review = PostReview.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update
      redirect_to root_path
    else
      render action: :new
    end
  end

  private

  def post_params
    params.require(:post)
    .permit(post_reviews_attributes:[:id, :item_name, :item_genre, :item_brand, :good_point, :image, :post_id, :star])
    .merge(user_id: current_user.id)
  end

end