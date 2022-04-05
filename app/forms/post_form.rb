class PostForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include Virtus.model

  attr_accessor :user_id, :item_name, :item_genre, :item_brand, :good_point, :image_id, :post_id, :star

  validates :item_name, presence: true
  validates :item_genre, presence: true
  validates :item_brand, presence: true

  def save
    post = Post.create(user_id: user_id)
    PostReview.create(post_id: post.id, item_name: item_name, item_genre: item_genre, item_brand: item_brand, good_point: good_point, image_id: image_id, star: star)
  end

end