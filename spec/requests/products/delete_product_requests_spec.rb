# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'DELETE /administrators/products/:id', type: :request do
  let!(:product) { create(:product) }

  context 'when logged in as administrator' do
    let!(:administrator) { create(:administrator) }

    before do
      login_as(administrator, scope: :administrator)
    end

    it 'deletes a product' do
      expect do
        delete administrator_product_path(product).to change(Product, :count).by(-1)
      end
    end
  end

  context 'when logged in user' do
    let!(:user) { create(:user) }

    before do
      login_as(user, scope: :user)
    end

    it 'is does not delete product' do
      expect do
        delete administrator_product_path(product).not_to change(Product, :count)
      end
    end
  end

  context 'when not logged in' do
    it 'does not delete a product' do
      expect do
        delete administrator_product_path(product).not_to change(Product, :count)
      end
    end
  end

end
