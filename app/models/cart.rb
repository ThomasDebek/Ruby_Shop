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

  def add_product(product)
    current_item = cart_items.find_by(product_id: product.id)
    cart_items.build(product_id: product.id) unless current_item
  end

end
