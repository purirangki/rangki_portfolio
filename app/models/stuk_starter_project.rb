class StukStarterProject < ActiveRecord::Base
  belongs_to :user
  has_many :stuk_starter_rewards

  validates :name, :short_description, :description, :image_url, :expiration_date, :goal, presence: true

  def pledges
    stuk_starter_rewards.flat_map(&:pledges)
  end
end
