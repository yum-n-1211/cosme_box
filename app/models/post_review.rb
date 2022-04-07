class PostReview < ApplicationRecord

  belongs_to :post
  has_one_attached :image

  def get_image
    if image.attached?
      image
    else
      'star-off.png'
    end
  end

  enum item_genre: {
    woman: 0, man: 1
  }
end
