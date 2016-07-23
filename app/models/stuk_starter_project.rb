class StukStarterProject < ActiveRecord::Base
  belongs_to :user
  has_many :stuk_starter_rewards

  validates :name, :short_description, :description, :image_url, :expiration_date, :goal, presence: true

  def stuk_starter_pledges
    stuk_starter_rewards.flat_map(&:stuk_starter_pledges)
  end

  def total_backed_amount
    stuk_starter_pledges.map(&:amount).inject(0, :+)
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
end
