class RenameListIdColumnToImageTags < ActiveRecord::Migration[5.2]
  def change
    rename_column :image_tags, :list_id, :post_ramen_id
  end
end
