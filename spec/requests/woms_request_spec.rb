require 'rails_helper'

RSpec.describe "Woms", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/woms/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/woms/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/woms/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/woms/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/woms/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
