class Wom < ApplicationRecord
  belongs_to :user
  belongs_to :store
  validates :user_id, presence: true
  validates :store_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 140 }
  validates :visit_date, presence: true
end
