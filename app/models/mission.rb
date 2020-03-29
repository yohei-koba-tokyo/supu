class Mission < ApplicationRecord
  has_many :mission_users, dependent: :destroy
  has_many :users, through: :mission_users
  belongs_to :friend
  has_many :messages, dependent: :destroy
  validates :name, :datetime, :friend_id, presence: true

  default_scope -> { order(datetime: :asc) }
end