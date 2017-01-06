class ChargesController < ApplicationController
  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Blocipedia Premium Membership",
      amount: Amount.new.value
    }
  end

  def create
    #Creates a Stripe Customer object for associating with charge
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: Amount.new.value,
      description: "BigMoney Membership - #{current_user.email}",
      currency: 'usd'
    )

    flash[:notice] = "Thanks for all the money, bruh! Keep it coming!"
    current_user.premium!
    redirect_to root_path

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end

  def destroy
    flash[:alert] = "YOUR ACCOUNT HAS BEEN DOWNGRADED, YUNG BLOC"
    current_user.member!
    redirect_to root_path
  end
end
