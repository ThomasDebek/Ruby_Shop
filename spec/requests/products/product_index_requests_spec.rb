require 'rails_helper'

RSpec.describe "Products::ProductIndexRequests", type: :request do
  describe "GET /products/product_index_requests" do
    it "works! (now write some real specs)" do
      get products_product_index_requests_index_path
      expect(response).to have_http_status(200)
    end
  end
end
