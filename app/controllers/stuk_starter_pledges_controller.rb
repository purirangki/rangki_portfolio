class StukStarterPledgesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_reward

  def index
    @stuk_starter_pledges = @stuk_starter_project.stuk_starter_pledges

    respond_to do |format|
      format.html
    end
  end

  def new
    @stuk_starter_pledge = current_user.stuk_starter_pledges.build
    @stuk_starter_rewards = @stuk_starter_project.stuk_starter_rewards

    respond_to do |format|
      format.html
    end
  end

  private
    def set_project
      @stuk_starter_project = StukStarterProject.find(params[:project_id])
    end

    def set_reward
      @stuk_starter_reward = @stuk_starter_project.stuk_starter_rewards.find_by_id(params[:reward_id])
    end

end