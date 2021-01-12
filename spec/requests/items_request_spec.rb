require 'rails_helper'

RSpec.describe "Items", type: :request do
  let!(:area) { create(:area, id: 1, name: "下北沢") }
  let!(:store) { create(:store, id: 1, name: "古着屋", area_id: 1, address: "東京都世田谷区北沢123-4") }
  let!(:user) { create(:user, email: "testuser@exaple.com", password: "testuser", introduction: "a" * 20) }

  context "購入予定アイテムの店舗別一覧のテスト" do
    before do
      sign_in user
      get store_list_path(store)
    end

    it "正しくHTTPステータスを返すこと" do
      expect(response).to have_http_status(:success)
    end

    it "正しいviewを返すこと" do
      expect(response).to render_template :list
    end

    it "画面に必要な要素が表示されていること" do
      expect(response.body).to include store.name
      expect(response.body).to include "店舗情報"
      expect(response.body).to include "クチコミ"
      expect(response.body).to include "購入予定のアイテム"
      expect(response.body).to include "欲しい古着アイテムを保存する"
    end
  end

  context "購入予定アイテムの保存画面のテスト" do
    before do
      sign_in user
      get new_store_item_path(store)
    end

    it "正しくHTTPステータスを返すこと" do
      expect(response).to have_http_status(:success)
    end

    it "正しいviewを返すこと" do
      expect(response).to render_template :new
    end

    it "画面に必要な要素が表示されていること" do
      expect(response.body).to include store.name
      expect(response.body).to include "店舗情報"
      expect(response.body).to include "クチコミ"
      expect(response.body).to include "購入予定のアイテム"
      expect(response.body).to include "保存"
    end
  end
end
