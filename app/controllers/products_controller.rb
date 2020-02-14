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
    if @img_attr.present?
      flash[:notice] = "出品が完了しました"
      redirect_to "/"
    else
      flash[:alert] = '出品に失敗しました。必須項目を確認してください。'
      redirect_to "/products/new"
    end
  end

  def show
    @product = Product.find(params[:id])
    @seller = User.find(@product.seller_id)
  end

  def edit


    @category = @product.category

    @child_categories = Category.where('ancestry = ?', "#{@category.parent.ancestry}")
    @grand_child = Category.where('ancestry = ?', "#{@category.ancestry}")

    image_amount = 5
    image_amount.freeze
    num = image_amount - (@product.images.length)
    num.times { @product.images.build }
  end

  def update
    if @product.update_attributes(update_params) && params.require(:product).keys[0] == "images_attributes"
      redirect_to root_path ,notice: '商品を編集しました'
    else
      redirect_to edit_product_path
    end
  end
  
  def destroy
    if @product.seller_id == current_user.id
      product.destroy
      redirect_to "/"
    else
      redirect_to show_products_path(product)
    end
  end

    private
  def set_product
    @product = Product.find_by(id: params[:id])
  end

  def product_params
    params.require(:product).permit(:name,:description,:category_id, :brand_id, :price, :description, :condition,:sending_method, :postage_burden,:area_id, :scheduled_sending_date, :size, images_attributes: [:image_url]).merge(seller_id: current_user.id, status: 0, payment_status: 0, sending_status: 0, recieving_status: 0)   
  end


  def update_params
    params.require(:product).permit(:name,:description,:category_id, :brand_id, :price, :description, :condition,:sending_method, :postage_burden,:area_id, :scheduled_sending_date, :size, images_attributes: [:image_url,:id]).merge(seller_id: current_user.id, status: 0, payment_status: 0, sending_status: 0, recieving_status: 0)
  end
end