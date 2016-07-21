class StukBook < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  has_many :e_stuk_sales

  validates_numericality_of :price, greater_than: 49, message: 'Must be at least 50 cents'
  
  scope :available, -> { where(availability: true) }

  mount_uploader :image, StukBookImageUploader
  mount_uploader :resource, StukBookResourceUploader
end
