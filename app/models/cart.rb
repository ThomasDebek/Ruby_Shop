class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  def total
    cart_items.inject(0) { |sum, item| item.total_price + sum}

    # cart_items.each do |cart_item|
    # sum = 0
    # sum += cart_item.total_price
    # end
    # sum
  end

  delegate :empty?, to: :cart_items
end
