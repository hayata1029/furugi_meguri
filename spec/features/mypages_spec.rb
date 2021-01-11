require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  let!(:user) { create(:user, email: "testuser@example.com", password: "testuser") }

  describe "マイページのテスト" do
    before do
      sign_in user
      visit user_path(user.id)
    end

    context "ふるぎめぐりのリンクを押した場合" do
      it "トップページに遷移すること" do
        click_link "ふるぎめぐり"
        expect(current_path).to eq root_path
      end
    end

    context "設定のリンクを押した場合" do
      it "マイページ設定画面へ遷移すること" do
        click_link "設定"
        expect(current_path).to eq edit_user_registration_path
      end
    end

    context "保存したお店のリンクを押した場合" do
      it "保存したお店一覧の画面へ遷移すること" do
        click_link "保存したお店"
        expect(current_path).to eq user_favorites_path(user.id)
      end
    end
  end

  describe "マイページ設定画面のテスト" do
    before do
      sign_in user
      visit edit_user_registration_path
    end

    context "ふるぎめぐりのリンクを押した場合" do
      it "トップページに遷移すること" do
        click_link "ふるぎめぐり"
        expect(current_path).to eq root_path
      end
    end

    context "マイページへのリンクを押した場合" do
      it "マイページへ遷移すること" do
        click_link "マイページ"
        expect(current_path).to eq user_path(user.id)
      end
    end
  end
end