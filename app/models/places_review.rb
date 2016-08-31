class PlacesReview < ActiveRecord::Base
  belongs_to :user
  belongs_to :place

  validates_presence_of :content, :score
end
