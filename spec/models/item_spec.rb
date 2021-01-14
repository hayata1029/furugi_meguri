require 'rails_helper'

RSpec.describe Item, type: :model do
  let!(:area) { create(:area, id: 1, name: "下北沢") }
  let!(:store) { create(:store, id: 1, name: "古着屋", area_id: 1, address: "東京都世田谷区北沢123-4") }
  let!(:user) { create(:user, id: 1, email: "testuser@exaple.com", password: "testuser", introduction: "a" * 20) }
  let!(:item) { create(:item, name: "Tシャツ", item_image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/270303_m.jpg')), price: 120, store_id: 1, user_id: 1) }

  context "正しい値を入力して保存した場合" do
    it "保存したアイテムは有効であること" do
      expect(item).to be_valid
    end
  end

  context "nameを空白で保存した場合" do
    it "保存したアイテムは有効でないこと" do
      item.name = " "
      expect(item).not_to be_valid
    end
  end

  context "nameをnilで保存した場合" do
    it "保存したアイテムは有効でないこと" do
      item.name = nil
      expect(item).not_to be_valid
    end
  end

  context "priceを空白で保存した場合" do
    it "保存したアイテムは有効でないこと" do
      item.price = " "
      expect(item).not_to be_valid
    end
  end

  context "priceをnilで保存した場合" do
    it "保存したアイテムは有効でないこと" do
      item.price = nil
      expect(item).not_to be_valid
    end
  end
end
