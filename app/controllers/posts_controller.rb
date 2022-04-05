class PostsController < ApplicationController

  def new
    @post_form = PostForm.new
  end

  def create
    @post_form = PostForm.new(post_form_params)
    if @post_form.valid?
      @post_form.save
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

  def post_form_params
    params.require(:post_form)
    .permit(:id, :item_name, :item_genre, :item_brand, :good_point, :image_id, :post_id, :star, :authenticity_token)
    .merge(user_id: current_user.id)
  end

end