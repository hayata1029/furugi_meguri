class ChangeDatatypePriceObItems < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :price, :integer, using: 'price::integer'
  end
end
