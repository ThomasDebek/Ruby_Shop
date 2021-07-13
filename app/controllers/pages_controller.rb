# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @products = Product.all.with_attached_main_image
    @products = @products.filter_by_category(params[:category]) if params[:category].present?
    @products = @products.filter_by_brand(params[:brand]) if params[:brand].present?
  end
end