class Place < ActiveRecord::Base
  validates_presence_of :name, :phone, :address, :website, :user_id

  belongs_to :user
end
