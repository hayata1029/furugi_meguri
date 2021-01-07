require 'rails_helper'

RSpec.describe 'Woms_create', type: :feature do
  let!(:area) { create(:area, id: 1, name: "下北沢") }
  let!(:store) { create(:store, id: 1, name: "古着屋", area_id: 1, address: "東京都世田谷区北沢123-4") }
  let!(:user) { create(:user, id: 1, email: "testuser@exaple.com", password: "testuser") }
  let!(:wom) { create(:wom, user_id: 1, store_id: 1, content: "a" * 140, title: "a" * 50, visit_date: "2019-01-23") }

  before do
    visit new_store_wom_path(store)
  end

  context "ふるぎめぐりのリンクを押した場合" do
    it "トップページに遷移すること" do
      click_link "ふるぎめぐり"
      expect(current_path).to eq root_path
    end
  end

  context "ログインリンクを押した場合" do
    it "ログインページに遷移すること" do
      click_link "ログイン"
      expect(current_path).to eq new_user_session_path
    end
  end
end
