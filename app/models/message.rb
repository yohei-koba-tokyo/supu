class Message < ApplicationRecord
  belongs_to :mission
  belongs_to :user

  validates :content, presence: true, unless: :image?
  
  mount_uploader :image, ImageUploader
end
