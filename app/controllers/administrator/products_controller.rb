# frozen_string_literal: true

class Administrator::ProductsController < ApplicationController
  include Pagy::Frontend
  layout 'administrator'
  def index
    @pagy, @products = pagy(Product.includes(:category, :brand).all)
    @products = @products.filter_by_category(params[:category]) if params[:category].present?
    @products = @products.filter_by_brand(params[:brand]) if params[:brand].present?
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

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to administrator_products_path, notice: 'Product edited successfully'
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to administrator_products_path, notice: 'Product deleted successfully'
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :category_id, :brand_id, :main_image)
  end
end

