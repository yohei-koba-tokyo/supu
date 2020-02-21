class Mission < ApplicationRecord
  has_many :mission_users
  has_many :users, through: :mission_users
  validates :name, presence: true, uniqueness: true
end
