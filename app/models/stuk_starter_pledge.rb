class StukStarterPledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :stuk_starter_reward

  before_validation :generate_uuid!, on: :create
  validates_presence_of :name, :address, :city, :country, :postal_code, :amount, :user_id
  after_create :check_if_funded

  def charged?
    status == 'charged'
  end

  def failed?
    status == "failed"
  end

  def pending?
    status == "pending"
  end

  def charged!
    update(status: "charged")
  end

  def void!
    update(status: "void")
  end

  private
    def generate_uuid!
      begin
        self.uuid = SecureRandom.hex(16)
      end while StukStarterPledge.find_by(uuid: self.uuid).present?
    end

    def check_if_funded
      stuk_starter_project.funded! if stuk_starter_project.total_backed_amount >= stuk_starter_project.goal
    end
end
