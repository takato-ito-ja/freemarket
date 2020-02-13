class ImageController < ApplicationController

  def destroy
    image = Image.find(params[:id])
    if image.product.seller_id == current_user.id
      image.destroy
      redirect_to :back
      # flash[:alert] = '商品を削除しました'
    else
      redirect_to edit_products_path(image.product)
      # flash[:alert] = '商品削除に失敗しました'
    end
  end


end
