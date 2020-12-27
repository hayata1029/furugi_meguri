require 'rails_helper'

RSpec.describe 'Stores', type: :feature do
  let!(:area) { create(:area, id: 1, name: '下北沢')}
  let!(:store) { create(:store, name: 'あああ', area_id: 1, outline: 'a' * 50, address: 'a' * 15, area: [area]) }

  before do
    visit search_path
  end

  context "店舗名や住所で検索してキーワードがヒットした場合" do
    before do
      fill_in '例) 店舗名か住所を入力してください', with: 'あああ'
      click_on '検索'
    end

    it "あああの店舗名は含まれていること" do
      expect(page).to have_content store.name
    end
  end

  context "other_storeの店舗の場合" do
    let!(:other_area) { create(:area, id: 2, name: '東中野')}
    let!(:other_store) { create(:store, name: 'かかか', area_id: 2, outline: 'a' * 50, address: 'a' * 15, area: [other_area])}

    before do
      fill_in '例) 店舗名か住所を入力してください', with: 'ききき'
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