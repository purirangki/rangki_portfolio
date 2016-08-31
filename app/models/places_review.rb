class PlacesReview < ActiveRecord::Base
  belongs_to :user
  belongs_to :place

  validates_presence_of :content, :score

  after_save :calculate_average

  def calculate_average
    avg = self.place.average_rating
    self.place.update_attributes(total_average: avg)
  end
end
