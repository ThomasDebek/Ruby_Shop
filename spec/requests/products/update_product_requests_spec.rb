require 'rails_helper'

RSpec.describe "Products::UpdateProductRequests", type: :request do
  describe "GET /products/update_product_requests" do
    it "works! (now write some real specs)" do
      get products_update_product_requests_index_path
      expect(response).to have_http_status(200)
    end
  end
end
