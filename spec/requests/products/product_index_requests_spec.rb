# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /administrator/', type: :request do
  let!(:user) { create(:user) }
  let!(:administrator) { create(:administrator) }
  let!(:product1)  { create(:product, name: 'product1') }
  let!(:product2)  { create(:product, name: 'product2') }

  context 'when logged in as administrator' do
    before do
      login_as(administrator, scope: :administrator)
      get '/administrator'
    end

    it 'is possible to access administrator root path' do
      expect(response.body).to include('Administrator Panel')
    end

    it 'is displaying all products' do
      expect(response.body).to include(product1.name).and include(product2.name)
    end
  end

  context 'when logged in as User' do
    before do
      login_as(user, scope: :user)
      get '/administrator'
      follow_redirect!
    end

    it 'redirects to root path' do
      expect(response).to redirect_to(root_path)
    end

    it 'informs about lack of authorization' do
      expect(response.body).to include('You are not authorized.')
    end
  end

  context 'when not logged in' do
    before do
      get '/administrator'
    end

    it 'redirects to root path' do
      expect(response).to redirect_to(root_path)
    end

    it 'informs about lack of authorization' do
      expect(response.body).to include('You are not authorized.')
    end
  end
end