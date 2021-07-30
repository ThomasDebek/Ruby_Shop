# frozen_string_literal: true

class Administrator::OrdersController < ApplicationController
  def index
    @orders = Order.order(created_at: :asc)
  end
end


