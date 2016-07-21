class StukBook < ActiveRecord::Base
  belongs_to :user
  
  scope :available, -> { where(availability: true) }
end
