class StukStarterPaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_reward
  before_action :set_amount
  before_action :set_client_token

  def new
    @stuk_starter_pledge = current_user.stuk_starter_pledges.build(payment_params)
    @stuk_starter_rewards = @stuk_starter_project.stuk_starter_rewards

    respond_to do |format|
      if @stuk_starter_reward && @amount.present? && @stuk_starter_reward.value <= @amount
        format.html
      else
        if @amount.present?
          flash[:error] = "Must be greater than the reward."
        else
          flash[:error] = "You must provide an amount."
        end
        format.html { redirect_to new_stuk_starter_project_stuk_starter_pledge_path(reward: @stuk_starter_reward) }
      end
    end
  end

  def create
    @stuk_starter_pledge = current_user.stuk_starter_pledges.build(payment_params)
    respond_to do |format|
      if @stuk_starter_pledge.valid?
        if current_user.customer_id && Braintree::Customer.find(current_user.customer_id)
          @stuk_starter_pledge.save
          format.html { redirect_to stuk_starter_project_path(@stuk_starter_project), notice: "Your pledge was created" }
        else
          result = Braintree::Customer.create(
            :email => current_user.email,
            :payment_method_nonce => params[:payment_method_nonce]
          )
          if result.success?
            @stuk_starter_pledge.save
            current_user.update(customer_id: result.customer.id)
            format.html { redirect_to stuk_starter_project_path(@stuk_starter_project), notice: "Your pledge was created" }
          else
            format.html { render :new }
          end
        end
      else
        format.html { render :new }
      end
    end
  end

  private

    def set_project
      @stuk_starter_project = StukStarterProject.friendly.find(params[:stuk_starter_project_id])
    end

    def set_amount
      @amount = payment_params[:amount].to_i
    end

    def set_reward
      @stuk_starter_reward = @stuk_starter_project.stuk_starter_rewards.find_by_id(payment_params[:stuk_starter_reward_id])
    end   

    def set_client_token
      @client_token = Braintree::ClientToken.generate(:customer_id => current_user.customer_id)
    end

    def payment_params
      params.require(:stuk_starter_pledge).permit(:stuk_starter_reward_id, :name, :amount, :address, :city, :country, :postal_code)
    end
end