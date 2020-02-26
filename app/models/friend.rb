class Friend < ApplicationRecord
  belongs_to :user
  has_many :missions
  validates :name, presence: true
end