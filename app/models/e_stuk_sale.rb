class EStukSale < ActiveRecord::Base
  before_create :populate_guid
  belongs_to :stuk_book

  private
    def populate_guid
      self.guid = SecureRandom.uuid()
    end
end
