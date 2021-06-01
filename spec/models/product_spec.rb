# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is valid Factory' do
    product = FactoryBot.build(:product)
    product.valid?
  end

  it 'is invalid without name' do
    product = FactoryBot.build(:product, name: nil)
    product.valid?
    expect(product.errors[:name]).to include("can't be blank")
  end
  describe 'Price' do
    it 'is invalid without price' do
      product = FactoryBot.build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end

    it 'has no price' do
      expect(FactoryBot.build(:product, price: nil)).to_not be_valid
    end

    it 'is product price must be positive ' do
      product = FactoryBot.build(:product)
      product.price = -1
      product.invalid?
      expect(product.errors[:price]).to eql(['must be greater than or equal to 0.01'])

      product.price = 0
      product.invalid?
      expect(product.errors[:price]).to eql(['must be greater than or equal to 0.01'])
    end
  end

  describe "Categories and Price" do
    it 'is invalid without name a product ' do
      category = FactoryBot.build(:category)
      category.save
      product = category.products.create(name: nil)
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end
  end
  
end
