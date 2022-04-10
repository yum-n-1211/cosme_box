class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  enum sex: { woman: 0, man: 1 }
  enum personal_color: { spring: 0, summer: 1, autumn: 2, winter: 3 }
  enum skin_quality: { normal: 0, dry: 1, oily: 2, mixed: 3 }

  def get_profile_image(width, height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/22623694.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_limit: [width, height]).processed
  end

  scope :search, -> (search_params) do      #scopeでsearchメソッドを定義。(search_params)は引数
    return if search_params.blank? #検索フォームに値がなければ以下の手順は行わない

    personal_color(search_params[:personal_color]).skin_quality(search_params[:skin_quality])
    .keyword1(search_params[:keyword1]).range(search_params[:range]) #下記で定義しているscopeメソッドの呼び出し。「.」で繋げている
  end

  scope :personal_color, -> (personal_color) { where('personal_color like?', personal_color) if personal_color.present? }  #scopeを定義。
  scope :skin_quality, -> (skin_quality) { where('skin_quality like?', skin_quality) if skin_quality.present? }
  scope :keyword1, -> (keyword1) { where("nickname like? OR personal_color like? OR skin_quality like?","%#{keyword1}%","%#{keyword1}%","%#{keyword1}%") if keyword1.present? }
  scope :range, -> (range) {}
 #scope :メソッド名 -> (引数) { SQL文 }
 #if 引数.present?をつけることで、検索フォームに値がない場合は実行されない

end
