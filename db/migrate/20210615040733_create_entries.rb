class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.references :user, type: :bigint, foreign_key: true
      t.references :room, type: :integer, foreign_key: true

      t.timestamps
    end
  end
end
