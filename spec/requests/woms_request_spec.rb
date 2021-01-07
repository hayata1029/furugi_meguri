require 'rails_helper'

RSpec.describe "Woms", type: :request do
  let!(:area) { create(:area, id: 1, name: "下北沢") }
  let!(:store) { create(:store, id: 1, name: "古着屋", area_id: 1, address: "東京都世田谷区北沢123-4") }
  let!(:user) { create(:user, id: 1, email: "testuser@exaple.com", password: "testuser") }
  let!(:wom) { create(:wom, user_id: 1, store_id: 1, content: "a" * 20, title: "a" * 10, visit_date: "2019-01-23") }

  context "クチコミ一覧画面のテスト" do
    before do
      get store_woms_path(store)
    end

    it "正しくHTTPステータスを返すこと" do
      expect(response).to have_http_status(:success)
    end

    it "正しいviewを返すこと" do
      expect(response).to render_template :index
    end

    it "画面に必要な要素が表示されていること" do
      expect(response.body).to include store.name
      expect(response.body).to include "住所：" + store.address
      expect(response.body).to include "店舗情報"
      expect(response.body).to include "クチコミ"
      expect(response.body).to include "クチコミを投稿する"
    end
  end

  context "クチコミ新規投稿画面のテスト" do
    before do
      get  new_store_wom_path(store)
    end

    it "正しくHTTPステータスを返すこと" do
      expect(response).to have_http_status(:success)
    end

    it "正しいviewを返すこと" do
      expect(response).to render_template :new
    end

    it "画面に必要な要素が表示されていること" do
      expect(response.body).to include store.name
      expect(response.body).to include "住所：" + store.address
      expect(response.body).to include "店舗情報"
      expect(response.body).to include "クチコミ"
      expect(response.body).to include "投稿する"
    end
  end

  context "クチコミ編集画面のテスト" do
    before do
      get edit_store_wom_path(store, wom)
    end

    it "正しくHTTPステータスを返すこと" do
      expect(response).to have_http_status(:success)
    end

    it "正しいviewを返すこと" do
      expect(response).to render_template :edit
    end

    it "画面に必要な要素が表示されていること" do
      expect(response.body).to include store.name
      expect(response.body).to include "住所：" + store.address
      expect(response.body).to include "店舗情報"
      expect(response.body).to include "クチコミ"
      expect(response.body).to include "更新する"
    end
  end
end
