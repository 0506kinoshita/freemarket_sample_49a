class CreditCardController < ApplicationController

  require "payjp"


  def new
    card = CreditCard
    redirect_to action: "show" if card.exists?
  end

  def pay
    Payjp.api_key = ENV["PAYJP_PRIVARE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        credit_card: params[payjp-token],
        metadata: {user_id: current_user.id}
      )
      @credit_card = credit_card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @credit_card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete
    card = credit_card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(credit_card.customer_id)
      customer.delete
      credit_card.delete
    end
      redirect_to action: "new"
  end

  def show
    card = credit_card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(credit_card.customer_id)
      @default_card_information = customer.credit_cards.retrieve(card.credit_card_id)
    end
  end
end
