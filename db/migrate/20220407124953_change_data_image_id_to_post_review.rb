class ChangeDataImageIdToPostReview < ActiveRecord::Migration[6.1]
  def change
    change_column :post_reviews, :image_id, :string
  end
end
