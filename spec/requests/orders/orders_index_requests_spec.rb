require 'rails_helper'

RSpec.describe 'GET /administrator/orders', type: :request do
  let!(:user) { create(:user) }
  let!(:administrator) { create(:administrator) }
  let!(:order1) { create(:order) }
  let!(:order2) { create(:order) }

  context 'when logged in as administrator' do
    before do
      login_as(administrator, scope: :administrator)
      get '/administrator/orders'
    end

    it 'is possible to access orders index' do
      expect(response.body).to include('Admin Panel').and include('<h2>Orders</h2>')
    end

    it 'is displaying all orders' do
      expect(response.body).to include(order1.id.to_s).and include(order2.id.to_s)
    end
  end

  context 'when logged in as User' do
    before do
      login_as(user, scope: :user)
      get '/administrator/orders'
    end

    it 'redirects to root path' do
      expect(response).to redirect_to(root_path)
    end

    it 'informs about lack of authorization' do
      follow_redirect!
      expect(response.body).to include('You are not authorized.')
    end
  end

  context 'when not logged in' do
    before do
      get '/administrator/orders'
    end

    it 'redirects to root path' do
      expect(response).to redirect_to(root_path)
    end

    it 'informs about lack of authorization' do
      follow_redirect!
      expect(response.body).to include('You are not authorized.')
    end
  end

end
