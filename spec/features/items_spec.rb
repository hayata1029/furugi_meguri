require 'rails_helper'

RSpec.describe 'Items', type: :feature do
  let!(:area) { create(:area, id: 1, name: "下北沢") }
  let!(:store) { create(:store, id: 1, name: "古着屋", area_id: 1, address: "東京都世田谷区北沢123-4") }
  let!(:user) { create(:user, id: 1, email: "testuser@exaple.com", password: "testuser", introduction: "a" * 20) }
  let!(:item) { create(:item, name: "Tシャツ", image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/270303_m.jpg')), price: 120, store_id: 1, user_id: 1)}

  describe "購入予定アイテムの店舗別一覧のテスト" do
    before do
      sign_in user
      visit store_list_path(store)
    end

    context "ふるぎめぐりのリンクを押した場合" do
      it "トップページに遷移すること" do
        click_link "ふるぎめぐり"
        expect(current_path).to eq root_path
      end
    end

    context "クチコミのリンクを押した場合" do
      it "クチコミ一覧画面へ遷移すること" do
        click_link "クチコミ"
        expect(current_path).to eq store_woms_path(store)
      end
    end

    context "欲しい古着アイテムを保存するを押した場合" do
      it "欲しい古着アイテムを保存するページへ遷移すること" do
        click_link "欲しい古着アイテムを保存する"
        expect(current_path).to eq new_store_item_path(store)
      end
    end

    context "編集のリンクを押すと" do
      it "編集ページへ遷移すること" do
        click_link "編集"
        expect(current_path).to eq edit_store_item_path(store, item)
      end
    end

    context "削除のリンクを押すと" do
      it "保存されていたデータが削除されること" do
        click_link "削除"
        expect(page).not_to have_content "Tシャツ"
      end
    end
  end

  describe "欲しい古着アイテムの保存画面のテスト" do
    before do
      sign_in user
      visit new_store_item_path(store)
    end

    context "ふるぎめぐりのリンクを押した場合" do
      it "トップページに遷移すること" do
        click_link "ふるぎめぐり"
        expect(current_path).to eq root_path
      end
    end

    context "クチコミのリンクを押した場合" do
      it "クチコミ一覧画面へ遷移すること" do
        click_link "クチコミ"
        expect(current_path).to eq  store_woms_path(store)
      end
    end
  end
end