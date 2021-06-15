class Administrator::ProductsController < ApplicationController
  layout 'administrator'
  before_action :authenticate_administrator!

  def index
  end

end
