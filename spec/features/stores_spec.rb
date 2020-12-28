require 'rails_helper'

RSpec.describe 'Stores', type: :feature do
  let!(:area) { create(:area, id: 1, name: '下北沢') }
  let!(:store) { create(:store, name: 'ふるぎや', area_id: 1, outline: 'a' * 50, address: 'a' * 15, area: [area]) }

  describe "トップ画面のテスト" do
    before do
      visit root_path
    end

    context "検索結果画面で店舗名や住所を検索してキーワードがヒットした場合" do
      it "ふるぎやの店舗名は含まれていること" do
        fill_in '例) 店舗名か住所を入力してください', with: 'ふるぎや'
        click_on '検索'
        expect(page).to have_content store.name
      end
    end

    context "ログイン用リンクを押した場合" do
      it "ログインページへ遷移すること" do
        click_link 'ログイン'
        expect(current_path).to eq new_user_session_path
      end
    end
  end

  describe "検索結果画面のテスト" do
    before do
      visit search_path
    end

    context "検索結果画面で店舗名や住所を検索してキーワードがヒットした場合" do
      it "ふるぎやの店舗名は含まれていること" do
        fill_in '例) 店舗名か住所を入力してください', with: 'ふるぎや'
        click_on '検索'
        expect(page).to have_content store.name
      end
    end

    context "ふるぎめぐりのリンクを押した場合" do
      it 'トップページへ遷移すること' do
        click_link 'ふるぎめぐり'
        expect(current_path).to eq root_path
      end
    end

    context "ログイン用リンクを押した場合" do
      it "ログインページへ遷移すること" do
        click_link 'ログイン'
        expect(current_path).to eq new_user_session_path
      end
    end

    context "other_storeの店舗の場合" do
      let!(:other_area) { create(:area, id: 2, name: '東中野') }
      let!(:other_store) { create(:store, name: 'ジャム', area_id: 2, outline: 'a' * 50, address: 'a' * 15, area: [other_area]) }

      before do
        fill_in '例) 店舗名か住所を入力してください', with: 'エンコート'
        click_on '検索'
      end

      it "other_storeの店舗名は含まれていないこと" do
        expect(page).not_to have_content other_store.name
      end

      it "「検索ワードに一致する店舗はありませんでした..と表示されること」" do
        expect(page).to have_content '検索ワードに一致する店舗はありませんでした..'
      end
    end
  end
end
