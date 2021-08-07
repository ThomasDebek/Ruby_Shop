# frozen_string_literal: true

class Administrator::OrdersController < ApplicationController
  layout 'administrator'
  def index
    @pagy, @orders = pagy(Order.order(created_at: :asc))
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items.includes(:product)
  end

  def total
    order_items.inject(0) { |sum, item| item.total_price + sum }
  end

end


