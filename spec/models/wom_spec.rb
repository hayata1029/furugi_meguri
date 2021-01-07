require 'rails_helper'

RSpec.describe Wom, type: :model do
  let!(:area) { create(:area, id: 1, name: "下北沢") }
  let!(:store) { create(:store, id: 1, name: "古着屋", area_id: 1, address: "東京都世田谷区北沢123-4") }
  let!(:user) { create(:user, id: 1, email: "testuser@exaple.com", password: "testuser") }
  let!(:wom) { create(:wom, user_id: 1, store_id: 1, content: "a" * 140, title: "a" * 50, visit_date: "2019-01-23") }

  context "正しい値を入力して作成した場合" do
    it "有効なクチコミであること" do
      expect(wom).to be_valid
    end
  end

  context "正しくない値を入力して作成した場合" do
    it "contentが140字以上の場合有効で無いこと" do
      wom.content = "a" * 141
      expect(wom).not_to be_valid
    end

    it "titleが50字以上の場合有効で無いこと" do
      wom.title = "a" * 51
      expect(wom).not_to be_valid
    end

    it "contentが空欄の場合有効で無いこと" do
      wom.content = " "
      expect(wom).not_to be_valid
    end

    it "titleが空欄の場合有効で無いこと" do
      wom.title = " "
      expect(wom).not_to be_valid
    end

    it "contentがnilの場合有効で無いこと" do
      wom.content = nil
      expect(wom).not_to be_valid
    end

    it "titleがnilの場合有効で無いこと" do
      wom.title = nil
      expect(wom).not_to be_valid
    end
  end
end
