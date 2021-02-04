class CreatePostRamen < ActiveRecord::Migration[5.2]
  def change
    create_table :post_ramen do |t|

      t.string :title, null: false
      t.text :content, null: false
      t.float :review, null: false
      t.string :image_id, null: false
      t.integer :user_id, null: false
      t.integer :shop_id
      t.timestamps
    end
  end
end
