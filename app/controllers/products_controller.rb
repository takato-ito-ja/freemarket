class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :show, :destroy]
  
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    5.times { @product.images.build }
  end 

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to "/"
  end

  def show
    @seller = User.find_by(id: @product.seller_id)
  end

  def edit
    @category = Category.find_by(id: @product.category_id)
    @child_categories = Category.where('ancestry = ?', "#{@category.parent.ancestry}")
    @grand_child = Category.where('ancestry = ?', "#{@category.ancestry}")

    image_amount = 5
    image_amount.freeze
    num = image_amount - (@product.images.length)
    num.times { @product.images.build }
    # render layout: 'application'
  end

  def update
    if @product.update(product_params) && params.require(:product).keys[0] == "images_attributes"
      redirect_to root_path ,notice: '商品を編集しました'
    else
      # flash[:alert] = '編集に失敗しました。必須項目を確認してください。'
      redirect_to edit_products_path
    end
  end
  
  def destroy
    if @product.seller_id == current_user.id
      @product.destroy
      redirect_to "/"
      # flash[:alert] = '商品を削除しました'
    else
      redirect_to show_products_path(product)
      # flash[:alert] = '商品削除に失敗しました'
    end
  end
    private
  def set_product
    @product = Product.find_by(id: params[:id])
  end

  def product_params
    # @img_attr = params[:product][:images_attributes]
    # params.require(:product).permit(:name, :category_id_id, :brand_id_id, :price, :description, :condition_id_id, :postage_burden_id_id, :sending_method_id_id, :area_id_id, :scheduled_sending_date, :size_id_id, images_attributes: [:image_url]).merge(seller_id: current_user.id, status: 0, payment_method: 0, payment_status: 0, sending_status: 0, recieving_status: 0)
    params.require(:product).permit(:name,:description,:category_id, :brand_id, :price, :description, :condition,:sending_method, :postage_burden,:area_id, :scheduled_sending_date, :size, images_attributes: [:image_url]).merge(seller_id: current_user.id, status: 0, payment_status: 0, sending_status: 0, recieving_status: 0)   
  end


  # def update_params
  #   params.require(:product).permit(:name, :description, :category_id, :brand_id, :price, :description, :condition, :sending_method, :postage_burden, :sending_method_id, :area_id, :scheduled_sending_date, :size_id, images_attributes: [:image_url,:id]).merge(seller_id: current_user.id, status: 0, payment_method: 0, payment_status: 0, sending_status: 0, recieving_status: 0)
  # end
end


