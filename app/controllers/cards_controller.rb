class CardsController < ApplicationController
  require "payjp"

  def new
    card = Card.where(user_id: current_user.id)
  end

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = ENV["PAYJP_ACCESS_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト', #なくてもOK
      email: current_user.email, #なくてもOK
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to "/"
      else
        redirect_to action: "pay"
      end
    end
  end

  def show
    @product = Product.find(params[:id])
    @seller = User.find_by(id: @product.seller_id)
  end

end
