class ImageController < ApplicationController
  def destroy
    image = Image.find(params[:id])
    if image.product.seller_id == current_user.id
      if image.product.images.length ==1
        redirect_to :back
        # 最後の一枚は削除できません
      else
        image.destroy
        redirect_to :back
      end
    else
      redirect_to "/"
    end
  end
end
