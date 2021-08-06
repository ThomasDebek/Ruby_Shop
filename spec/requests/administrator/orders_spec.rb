require 'rails_helper'

RSpec.describe "Administrator::Orders", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/administrator/orders/index"
      expect(response).to have_http_status(:success)
    end
  end

end
