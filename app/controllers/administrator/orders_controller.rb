# frozen_string_literal: true

class Administrator::OrdersController < ApplicationController
  layout 'administrator'
  def index
    @pagy, @orders = pagy(Order.order(created_at: :asc))
  end
end


