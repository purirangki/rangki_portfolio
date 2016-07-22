class StukStarterRewardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project

  def new
    @stuk_starter_reward = @stuk_starter_project.stuk_starter_rewards.build
    
    respond_to do |format|
      format.html
    end
  end

  def create
    @stuk_starter_reward = @stuk_starter_project.stuk_starter_rewards.build(reward_params)

    respond_to do |format|
      if @stuk_starter_reward.save
        format.html { redirect_to @stuk_starter_project, notice: 'Reward was successfully created' }
      else
        format.html { render :new }
      end
    end
  end

  private
    def set_project
      @stuk_starter_project = StukStarterProject.find(params[:project_id])
    end

    def reward_params
      params.require(:reward).permit(:name, :description, :value, :shipping, :number_available, :estimated_delivery)
    end

end