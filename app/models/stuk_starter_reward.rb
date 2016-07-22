class StukStarterReward < ActiveRecord::Base
  belongs_to :stuk_starter_project

  validates :description, :value, :estimated_delivery, presence: true
  validates :value, numericality: { greater_than_or_equal_to: 0 }
  validates :number_available, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  validates :estimated_delivery, date: { after: Date.today }
end
