require 'rails_helper'

RSpec.describe User, type: :model do
  
  context "正しい値を入力して作成した場合" do
    let!(:user) { create(:user, email: "testuser@example.com", password: "testuser") }
    it "ユーザーは有効であること" do
      expect(user).to be_valid
    end
  end

  context "登録されているユーザー情報は" do
    let!(:user) { create(:user, email: "testuser@example.com", password: "testuser") }
    user_2 = FactoryBot.build(:user, email: "testuser@example.com", password: "testuser")
    it "一意のユーザーであること" do
      expect(user_2).not_to be_valid
    end
  end

  context "メールアドレスをnilで作成した場合" do
    user = FactoryBot.build(:user, email: nil)

    it "ユーザーは有効でないこと" do
      expect(user).not_to be_valid
    end
  end

  context "メールアドレスに何も入れないで作成した場合" do
    user = FactoryBot.build(:user, email: " ")

    it "ユーザーは有効でないこと" do
      expect(user).not_to be_valid
    end
  end

  context "パスワードをnilで作成した場合" do
    user = FactoryBot.build(:user, password: nil)

    it "ユーザーは有効でないこと" do
      expect(user).not_to be_valid
    end
  end

  context "パスワードに何も入れないで作成した場合" do
    user = FactoryBot.build(:user, password: " ")

    it "ユーザーは有効でないこと" do
      expect(user).not_to be_valid
    end
  end

  context "パスワードにを６文字以下で作成した場合" do
    user = FactoryBot.build(:user, password: "test")

    it "ユーザーは有効でないこと" do
      expect(user).not_to be_valid
    end
  end
end
