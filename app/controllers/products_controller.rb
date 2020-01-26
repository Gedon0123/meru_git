class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :show]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      redirect_to new_product_path
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.delete

    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name,:price,:description,:image,
                                    :buyer_id,:saler_id,:state,:deposit,:shipping)
  end
end
