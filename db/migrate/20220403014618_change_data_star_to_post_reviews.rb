class ChangeDataStarToPostReviews < ActiveRecord::Migration[6.1]
  def change
    change_column :post_reviews, :star, :float
  end
end
