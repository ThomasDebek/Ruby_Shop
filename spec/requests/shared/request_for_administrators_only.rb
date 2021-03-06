# frozen_string_literal: true
require 'rails_helper'

RSpec.shared_examples 'request for administrators only' do
  context 'when logged in as User' do
    let!(:user) { create(:user) }

    before do
      login_as(user, scope: :user)
      get path
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
      get path
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
