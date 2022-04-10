class PostReview < ApplicationRecord

  belongs_to :post
  has_one_attached :image

  enum item_genre: {
    woman: 0, man: 1
  }

  def get_image
    if image.attached?
      image
    else
      'star-off.png'
    end
  end

  scope :search, -> (search_params) do      #scopeでsearchメソッドを定義。(search_params)は引数
    return if search_params.blank?      #検索フォームに値がなければ以下の手順は行わない

    item_genre(search_params[:item_genre]).keyword2(search_params[:keyword2]).range(search_params[:range])  #下記で定義しているscopeメソッドの呼び出し。「.」で繋げている
  end

  scope :item_genre, -> (item_genre) { where('item_genre like?', item_genre) if item_genre.present? }  #scopeを定義。
  scope :keyword2, -> (keyword2) { where("item_name like? OR item_brand like?","%#{keyword2}%", "%#{keyword2}%") if keyword2.present? }
  scope :range, ->(range) {}
 #scope :メソッド名 -> (引数) { SQL文 }
 #if 引数.present?をつけることで、検索フォームに値がない場合は実行されない

end