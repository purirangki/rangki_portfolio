class StukStarterProject < ActiveRecord::Base
  belongs_to :user
  has_many :stuk_starter_rewards

  validates :name, :short_description, :description, :image_url, :expiration_date, :goal, presence: true
end
