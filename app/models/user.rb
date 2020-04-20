class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :mission_users
  has_many :missions, through: :mission_users
  has_many :friends
  has_many :messages
  validates :nickname, presence: true, length: { maximum: 7 }
end
