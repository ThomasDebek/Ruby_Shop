require 'rails_helper'

RSpec.describe 'POST /administrator/products', type: :request do
  before do
    login_as(create(:administrator))
  end

  context 'when attributes are valid' do
    it 'creates new product' do
      post '/administrator/products', params: {
        product: { name: 'new_product', price: '100' }
      }

      expect(Product.count).to eq(Product.count)
    end
  end

  context 'when attributes are invalid' do
    it 'does not create a new product without a name' do
      post '/administrator/products', params: {
        product: {name: nil,  price: '100' }
      }

      expect(Product.count).to eq(Product.count )
    end

    it 'does not create a new product without a price' do
      post '/administrator/products', params: {
        product: { name: 'new_product', price: nil }
      }

      expect(Product.count).to eq(Product.count)
    end
  end
end