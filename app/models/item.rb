class Item < ApplicationRecord
  mount_uploader :item_image, ItemImageUploader
  belongs_to :user
  belongs_to :store
  validates :name, presence: true
  validates :price, presence: true
  validates :item_image, presence: true
end
