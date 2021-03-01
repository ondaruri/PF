class CreateImageTags < ActiveRecord::Migration[5.2]
  def change
    create_table :image_tags do |t|
      t.string :name
      t.integer :list_id

      t.timestamps
    end
  end
end
