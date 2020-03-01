class Mission < ApplicationRecord
  has_many :mission_users
  has_many :users, through: :mission_users
  belongs_to :friend
  has_many :messages
  validates :name, :datetime, :friend_id, presence: true

  default_scope -> { order(datetime: :asc) }
  validate  :date_not_before_today
  def date_not_before_today
    errors.add(:datetime, "は今日以降のものを選択してください") if datetime.nil? || datetime < Date.today
  end
end
