require 'rails_helper'

RSpec.describe "Stores", type: :request do
  describe "トップページのテスト" do
    before do
      get root_path
    end

    it "正しくHTTPステータスを返すこと" do
      expect(response).to have_http_status(:success)
    end

    it "ログイン用のリンクが表示されていること" do
      expect(response.body).to include "ログイン"
    end

    it "検索用のフォームが表示されていること" do
      expect(response).to render_template(partial: 'stores/_search_form')
    end

    it "エリアで探す検索用のフォームが表示されていること" do
      expect(response).to render_template(partial: 'stores/_search_area')
    end

    it "ジャンルで探す検索用のフォームが表示されていること" do
      expect(response).to render_template(partial: 'stores/_search_genre')
    end
  end

  describe "検索結果画面のテスト" do
    let!(:area) { create(:area, id: 1, name: '下北沢')}
    let!(:store) { create(:store, name: 'あああ', area_id: 1, outline: 'a' * 50, address: '東京都世田谷区北沢２丁目３６−２') }

    before do
      get search_path
    end

    it "正しくHTTPステータスを返すこと" do
      expect(response).to have_http_status(:success)
    end

    it "正しいviewを返すこと" do
      expect(response).to render_template :search
    end

    it "店舗名が表示されていること" do
      expect(response.body).to include store.name
    end

    it "店舗概要が表示されていること" do
      expect(response.body).to include store.outline
    end

    it "店舗の住所が表示されていること" do
      expect(response.body).to include store.address
    end
  end
end
