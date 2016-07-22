class StukStarterPledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :stuk_starter_reward

  before_validation :generate_uuid!, on: :create
  validates_presence_of :name, :address, :city, :country, :postal_code, :amount, :user_id

  private
    def generate_uuid!
      begin
        self.uuid = SecureRandom.hex(16)
      end while StukStarterPledge.find_by(uuid: self.uuid).present?
    end
end
