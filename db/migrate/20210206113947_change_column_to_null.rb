class ChangeColumnToNull < ActiveRecord::Migration[5.2]

  def up
    # Not Null制約を外す場合　not nullを外したいカラム横にtrueを記載
    change_column_null :post_ramens, :user_id, true
    change_column_null :post_ramens, :image_id, true
    change_column_null :post_ramens, :review, true
    change_column_null :post_ramens, :content, true
    change_column_null :post_ramens, :title, true
  end

  def down
    change_column_null :post_ramens, :user_id, false
    change_column_null :post_ramens, :image_id, false
    change_column_null :post_ramens, :review, false
    change_column_null :post_ramens, :content, false
    change_column_null :post_ramens, :title, false
  end
end
