class ImageController < ApplicationController

  def destroy
    image = Image.find(params[:id])
    if image.product.seller_id == current_user.id
      image.destroy
      redirect_to :back
    else
      redirect_to "/"
    end
  end


end
