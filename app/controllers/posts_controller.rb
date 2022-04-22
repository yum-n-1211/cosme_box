class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def new
    @post = Post.new
    5.times {@post.post_reviews.build}
  end

  def create
    @post = Post.new(post_params)
    if @post.save #@post_form.valid?
      redirect_to post_path(@post.id)
    else
      render action: :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_reviews = @post.post_reviews
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render action: :edit
    end
  end

  private

  def post_params
    params.require(:post)
    .permit(post_reviews_attributes:[:id, :item_name, :item_genre, :item_brand, :good_point, :image, :post_id, :star])
    .merge(user_id: current_user.id)
  end

end