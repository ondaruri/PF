class AddMapsToPostRamens < ActiveRecord::Migration[5.2]
  def change
    add_column :post_ramens, :shop_name, :string
    add_column :post_ramens, :address, :string
    add_column :post_ramens, :latitude, :float
    add_column :post_ramens, :longitude, :float
  end
end
