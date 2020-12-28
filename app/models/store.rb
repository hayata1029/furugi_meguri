class Store < ApplicationRecord
  belongs_to :area
  has_many :store_images
end
