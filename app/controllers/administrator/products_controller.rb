class Administrator::ProductsController < ApplicationController
  layout 'administrator'
  before_action :authenticate_administrator!

  def index
    @products = Product.all
  end

end
