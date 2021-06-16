class RenameUserIdIdClolumnToMessages < ActiveRecord::Migration[5.2]
  def change
    rename_column :messages, :user_id_id, :user_id
    rename_column :messages, :room_id_id, :room_id
  end
end
