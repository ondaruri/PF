class CreatePostRamens < ActiveRecord::Migration[5.2]
  def change
    create_table :post_ramens do |t|

      t.integer :user_id, null: false
      t.string :image_id, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.integer :shop_id
      t.float :review, null: false
      t.timestamps
    end
  end
end
