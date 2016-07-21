class StukBook < ActiveRecord::Base
  scope :available, -> { where(availability: true) }
end
