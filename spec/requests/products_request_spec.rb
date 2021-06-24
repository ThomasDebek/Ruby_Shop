require 'rails_helper'

RSpec.describe 'Products', type: :request do
  before do
    login_as(create(:administrator))
  end

  describe 'POST /administrator/products' do
    let(:product) { create(:product) }

    context 'when attributes are valid' do
      before do
        post '/administrator/products', params: {
          product: { name: product.name, price: product.price }
        }
      end

      it 'redirects to administrator/products' do
        expect(response).to redirect_to(administrator_products_path)
      end

      it 'adds new product' do
        follow_redirect!
        expect(response.body).to include(product.name)
      end
    end
  end

end