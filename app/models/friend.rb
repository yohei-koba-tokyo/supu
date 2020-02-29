class Friend < ApplicationRecord
  belongs_to :user
  has_many :missions
  validates :name, presence: true
  default_scope -> { order(name: :asc) }
end