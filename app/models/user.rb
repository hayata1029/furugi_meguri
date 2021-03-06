class User < ApplicationRecord
  has_many :woms, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :items, dependent: :destroy
  # has_many :favorite_store, through: favorites, source: :store
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by!(username: 'テストユーザー', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
end
