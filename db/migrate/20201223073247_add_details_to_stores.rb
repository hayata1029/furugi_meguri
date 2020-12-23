class AddDetailsToStores < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :outline, :text
    add_column :stores, :image, :string
    add_column :stores, :address, :string
    add_column :stores, :postal_code, :string
  end
end
