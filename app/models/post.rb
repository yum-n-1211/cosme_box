class Post < ApplicationRecord

  belongs_to :user
  has_many :post_reviews, dependent: :destroy
  has_many :likes, dependent: :destroy

  accepts_nested_attributes_for :post_reviews

  validates_associated :post_reviews
  validates :post_reviews, presence: true

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

end
