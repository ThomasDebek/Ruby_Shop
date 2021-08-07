require 'rails_helper'
require_relative '../shared/request_for_administrators_only'

RSpec.describe 'GET /orders/:id', type: :request do
  let!(:order) { create(:order) }
  let!(:order_item) { create(:order_item, order: order) }

  context 'when logged in as administrator' do
    let!(:administrator) { create(:administrator) }

    before do
      login_as(administrator, scope: :administrator)
    end

    it 'returns order\'s details' do
      get "/administrator/orders/#{order.id}"
      expect(response.body).to include(order.id.to_s).and include(order.state)
                                                            .and include(order.user.email).and include(order_item.product.name)
                                                                                                 .and include(order.total.to_s)
    end
  end

  it_behaves_like 'request for administrators only' do
    let(:path) { "/administrator/orders/#{order.id}" }
  end
end