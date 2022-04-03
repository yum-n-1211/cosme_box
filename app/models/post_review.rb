class PostReview < ApplicationRecord
  
  belongs_to :post
  has_one_attached :image
  
  enum item_genre: {
    woman: 0, man: 1
  }
end
