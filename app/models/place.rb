class Place < ActiveRecord::Base
  validates_presence_of :name, :phone, :address, :website, :user_id

  belongs_to :user

  geocoded_by :address
  after_validation :geocode

  has_many :places_reviews, dependent: :destroy

  def average_rating
    self.places_reviews.sum(:score) / places_reviews.size
  rescue ZeroDivisionError
    0
  end
end
