class Store < ApplicationRecord
  belongs_to :area
  has_many :store_images
  has_many :woms
end
