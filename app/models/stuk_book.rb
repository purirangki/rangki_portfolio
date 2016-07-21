class StukBook < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  
  scope :available, -> { where(availability: true) }

  mount_uploader :image, StukBookImageUploader
  mount_uploader :resource, StukBookResourceUploader
end
