class Friend < ApplicationRecord
  belongs_to :user
  has_many :missions, dependent: :destroy
  validates :name, presence: true, length: { maximum: 7 }
  default_scope -> { order(name: :asc) }



end