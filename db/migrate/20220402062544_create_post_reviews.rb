class CreatePostReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :post_reviews do |t|

      t.integer:post_id,    null: false
      t.string:item_name,   null: false
      t.string:item_brand,  null: false
      t.integer:item_genre, null: false
      t.integer:image_id
      t.integer:star,       null: false
      t.text:good_point

      t.timestamps
    end
  end
end