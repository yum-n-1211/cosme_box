class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @search_params = search_params
    @range = search_params[:range]
    if @range == "User"
      @users = User.search(@search_params)
    else
      @post_reviews = PostReview.search(@search_params)
    end
  end

  def search_params
    params.fetch(:search, {}).permit(:range, :personal_color, :skin_quality, :keyword2, :item_genre, :keyword1)
    #fetch(:search, {})と記述することで、検索フォームに値がない場合はnilを返し、エラーが起こらなくなる
    #ここでの:searchには、フォームから送られてくるparamsの値が入っている
  end

end
