class AddStoreIdToStoreImages < ActiveRecord::Migration[6.0]
  def change
    add_reference :store_images, :store, foreign_key: true
  end
end
