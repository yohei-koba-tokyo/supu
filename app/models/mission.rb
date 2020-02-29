class Mission < ApplicationRecord
  has_many :mission_users
  has_many :users, through: :mission_users
  belongs_to :friend
  has_many :messages
  validates :name, :datetime, :friend_id, presence: true
end
