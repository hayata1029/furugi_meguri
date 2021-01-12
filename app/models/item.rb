class Item < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :store
  validates :name, presence: true
  validates :price, presence: true
  validates :image, presence: true
end
