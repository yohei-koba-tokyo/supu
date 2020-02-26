class Mission < ApplicationRecord
  has_many :mission_users
  has_many :users, through: :mission_users
  belongs_to :friend
  validates :name, :datetime, presence: true
end
