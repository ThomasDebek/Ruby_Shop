require 'rails_helper'

RSpec.describe "Products::AddProductRequests", type: :request do
  describe "GET /products/add_product_requests" do
    it "works! (now write some real specs)" do
      get products_add_product_requests_index_path
      expect(response).to have_http_status(200)
    end
  end
end
