class Store < ApplicationRecord
  belongs_to :area
  has_many :store_images
  has_many :woms, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :items, dependent: :destroy

  def favorite_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
