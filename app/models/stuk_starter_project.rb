class StukStarterProject < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :user
  has_many :stuk_starter_rewards

  before_validation :start_project, on: :create
  validates :name, :short_description, :description, :image_url, :expiration_date, :goal, presence: true
  after_create :charge_backers_if_funded

  def stuk_starter_pledges
    stuk_starter_rewards.flat_map(&:stuk_starter_pledges)
  end

  def total_backed_amount
    stuk_starter_pledges.map(&:amount).inject(0, :+)
  end

  def funding_percentage
    backed = total_backed_amount
    backed.zero? ? 0 : (backed / goal * 100).to_f.round
  end

  def days_to_go
    (self.expiration_date.to_date - Date.today).to_i
  end

  def funded?
    status == "funded"
  end

  def expired?
    status = "expired"
  end

  def canceled?
    status == "canceled"
  end

  def funded!
    update(status: "funded")
  end

  def expired!
    update(status: "expired")
    void_pledges
  end

  def canceled!
    update(status: "canceled")
    void_pledges
  end

  private

    def void_pledges
      self.pledges.each { |p| p.void! }
    end

    def start_project
      self.expiration_date = 1.month.from_now
    end

    def charge_backers_if_funded
      ChargeBackersJob.set(wait_until: self.expiration_date).perform_later self.id
    end

    def slug_candidates
      [
        :name,
        [:name, :created_at]
      ]
    end
end
