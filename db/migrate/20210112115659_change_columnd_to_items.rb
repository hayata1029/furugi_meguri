class ChangeColumndToItems < ActiveRecord::Migration[6.0]
  def change
    change_column_null :items, :image, false
    change_column_null :items, :price, false
  end
end
