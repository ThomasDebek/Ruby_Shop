class Administrator::ProductsController < ApplicationController
  layout 'administrator'
  before_action :authenticate_administrator!

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to administrator_products_path, notice: 'Product added successfully'
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :category_id, :brand_id, :main_image)
  end

end
