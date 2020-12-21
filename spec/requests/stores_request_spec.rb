require 'rails_helper'

RSpec.describe "Stores", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/stores/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /seach" do
    it "returns http success" do
      get "/stores/seach"
      expect(response).to have_http_status(:success)
    end
  end

end
