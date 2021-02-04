class CreateClips < ActiveRecord::Migration[5.2]
  def change
    create_table :clips do |t|

      t.integer :post_ramen_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
