class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def mypage
    @user = current_user
    likes = Like.where(user_id: current_user.id).pluck( :post_id)
    @like_list = Post.find(likes)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to mypage_path
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @user = current_user
    @user.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :birthday, :sex, [:personal_color].to_s, [:skin_quality].to_s, :introduction, :profile_image, :email)
  end

end
