# frozen_string_literal: true

class AddRefBrandToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :brand
  end
end
