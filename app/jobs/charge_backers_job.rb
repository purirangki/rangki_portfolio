class ChargeBackersJob < ActiveJob::Base
  queue_as :default

  def perform(id)
    @project = StukStarterProject.find(id)
    if @project.funded?
      @project.stuk_starter_pledges.each do |pledge|
        pledge.charge! unless pledge.charged!
      end
    else
      @project.expired!
    end
  end
end