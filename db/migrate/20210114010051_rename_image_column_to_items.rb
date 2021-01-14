class RenameImageColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :image, :item_image
  end
end
