# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Administrator Dashboard', type: :request do
  let!(:user) { create(:user) }
  let!(:administrator) { create(:administrator) }

  describe 'GET /administrator' do
    context 'when not logged in' do
      it 'redirects to root path' do
        get '/administrator'
        expect(response).to redirect_to(root_path)
        follow_redirect!
        expect(response.body).to include('You are not authorized.')
      end
    end

    context 'when logged in as User' do
      it 'redirects to root path' do
        login_user(user)
        get '/administrator'
        expect(response).to redirect_to(root_path)
        follow_redirect!
        expect(response.body).to include('You are not authorized.')
      end
    end

    context 'when logged in as Administrator' do
      let!(:product_1)  { create(:product, name: 'product_1') }
      let!(:product_2)  { create(:product, name: 'product_2') }
      before do
        login_administrator(administrator)
      end

      it 'is possible to access admin root path' do
        get '/administrator'
        expect(response.body).to include('Administrator Panel')
      end

      it 'is possible to access administrator root path' do
        get '/administrator/products'
        expect(response.body).to include(product_1.name)
        expect(response.body).to include(product_2.name)
      end
    end
  end
end
