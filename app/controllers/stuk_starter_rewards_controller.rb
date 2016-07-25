class StukStarterRewardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_reward, except: [:new, :create]
  load_and_authorize_resource through: :stuk_starter_project

  def new
    @stuk_starter_reward = @stuk_starter_project.stuk_starter_rewards.build
    
    respond_to do |format|
      format.html
    end
  end

  def edit
    
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

  def update
    respond_to do |format|
      if @stuk_starter_reward.update(reward_params)
        format.html { redirect_to @stuk_starter_project, notice: 'Reward was successfully updated' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @stuk_starter_reward.destroy

    respond_to do |format|
      format.html { redirect_to stuk_starter_projects_path(@stuk_starter_project), notice: 'Reward was successfully destroyed' }
    end
  end


  private
    def set_project
      @stuk_starter_project = StukStarterProject.friendly.find(params[:stuk_starter_project_id])
    end

    def set_reward
      @stuk_starter_reward = @stuk_starter_project.stuk_starter_rewards.find(params[:id])
    end

    def create_params
      params.require(:stuk_starter_reward).permit(:name, :description, :value, :shipping, :number_available, :estimated_delivery)
    end

    def reward_params
      params.require(:stuk_starter_reward).permit(:name, :description, :value, :shipping, :number_available, :estimated_delivery)
    end

end