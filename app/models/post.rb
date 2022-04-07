class Post < ApplicationRecord

  belongs_to :user
  has_many :post_reviews, dependent: :destroy

  accepts_nested_attributes_for :post_reviews

end
