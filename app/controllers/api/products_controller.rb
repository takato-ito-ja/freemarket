class Api::ProductsController < ApplicationController

  def child
    @child_categories = Category.where('ancestry = ?', "#{params[:id]}")
    respond_to do |format|
      format.html
      format.json
    end
  end

  def grand_child
    unless params[:id].empty?
      id = "/" + "#{params[:id]}"
      @grand_child_categories = Category.where('ancestry LIKE(?)', "%#{id}")
      respond_to do |format|
        format.html
        format.json
      end
    end
  end

  def image_destroy
    image = Image.find(params[:img_id])
    if image.product.seller_id == current_user.id
      image.destroy
    end
  end

end