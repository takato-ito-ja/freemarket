class CardsController < ApplicationController

def show
  # @product = Product.find_by(id: params[:id])

  @product = Product.find(params[:id])
  @seller = User.find_by(id: @product.seller_id)
end

end
