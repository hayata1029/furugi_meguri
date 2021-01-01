require 'rails_helper'

RSpec.describe "Users", type: :request do
  context "ログイン画面のテスト" do
    let!(:user) { create(:user, email: "testuser@exaple.com", password: "testuser") }

    before do
      get new_user_session_path
    end

    it "正しくHTTPステータスを返すこと" do
      expect(response).to have_http_status(:success)
    end

    it "正しいviewを返すこと" do
      expect(response).to render_template :new
    end

    it "画面に必要な要素が表示されていること" do
      expect(response.body).to include "ログイン"
      expect(response.body).to include "メールアドレス"
      expect(response.body).to include "パスワードを忘れた場合"
      expect(response.body).to include "新規アカウント登録の場合はこちら"
      expect(response.body).to include "ゲストログイン（閲覧用）"
    end
  end

  context "新規アカウント登録画面のテスト" do
    before do
      get new_user_registration_path
    end

    it "正しくHTTPステータスを返すこと" do
      expect(response).to have_http_status(:success)
    end

    it "正しいviewを返すこと" do
      expect(response).to render_template :new
    end

    it "画面に必要な要素が表示されていること" do
      expect(response.body).to include "新規アカウント作成"
      expect(response.body).to include "メールアドレス"
      expect(response.body).to include "パスワード"
      expect(response.body).to include "確認用パスワード"
      expect(response.body).to include "アカウント作成"
    end
  end
end