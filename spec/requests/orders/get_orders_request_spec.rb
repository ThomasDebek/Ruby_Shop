require 'rails_helper'
require_relative '../shared/request_for_administrators_only'

RSpec.describe 'GET /orders/:id', type: :request do
  let!(:order) { create(:order) }
  let!(:order_item) { create(:order_item, order: order) }


  #it_behaves_like 'request restricted to administrators' do
  #  let(:path) { "/administrator/orders/#{order.id}" }
  #end

end
