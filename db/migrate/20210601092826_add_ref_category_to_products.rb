# frozen_string_literal: true

class AddRefCategoryToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :category
  end
end
