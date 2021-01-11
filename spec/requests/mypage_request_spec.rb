require 'rails_helper'

RSpec.describe "Users", type: :request do
  let!(:user) { create(:user, email: "testuser@exaple.com", password: "testuser", introduction: "a" * 20) }

  context "マイページのテスト" do
    before do
      get user_path(user.id)
    end

    it "正しくHTTPステータスを返すこと" do
      expect(response).to have_http_status(:success)
    end

    it "画面に必要な要素が表示されていること" do
      expect(response.body).to include "設定"
      expect(response.body).to include "保存したお店"
      expect(response.body).to include "欲しい古着"
      expect(response.body).to include user.introduction
    end
  end

  context "マイページ設定画面のテスト" do
    let!(:user) { create(:user, email: "westuser@exaple.com", password: "westuser") }

    before do
      sign_in user
      get edit_user_registration_path
    end

    it "正しくHTTPステータスを返すこと" do
      expect(response).to have_http_status(:success)
    end
    
    it "画面に必要な要素が表示されていること" do
      expect(response.body).to include "アカウントの設定"
      expect(response.body).to include "アカウントの名前"
      expect(response.body).to include "メールアドレス"
      expect(response.body).to include "自己紹介"
      expect(response.body).to include "新しいパスワード"
      expect(response.body).to include "新しいパスワード（確認用"
      expect(response.body).to include "古いパスワード"
      expect(response.body).to include "更新"
    end
  end
end