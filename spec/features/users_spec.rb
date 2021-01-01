require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  describe "ログイン画面のテスト" do
    let!(:user) { create(:user, email: "testuser@example.com", password: "testuser") }

    before do
      visit new_user_session_path
    end

    context "ふるぎめぐりのリンクを押した場合" do
      it "トップページに遷移すること" do
        click_link "ふるぎめぐり"
        expect(current_path).to eq root_path
      end
    end

    context "パスワードを忘れた場合のリンクを押した場合" do
      it "パスワード再発行画面に遷移すること" do
        click_link "パスワードを忘れた場合"
        expect(current_path).to eq new_user_password_path
      end
    end

    context "登録されているユーザー情報を入れた場合" do
      it "ログインに成功すること" do
        fill_in "メールアドレス", with: "testuser@example.com"
        fill_in "パスワード", with: "testuser"
        click_button "ログイン"
        expect(page).to have_content "ログインしました"
      end
    end

    context "登録されていないユーザー情報を入れた場合" do
      it "ログインに失敗すること" do
        fill_in "メールアドレス", with: "missuser@example.com"
        fill_in "パスワード", with: "missuser"
        click_button "ログイン"
        expect(page).to have_content "メールアドレス もしくはパスワードが不正です。"
      end
    end
  end

  describe "新規アカウント登録画面のテスト" do
    let!(:user) { create(:user, email: "testuser@example.com", password: "testuser") }

    before do
      visit new_user_registration_path
    end

    context "正しい情報を入力した場合" do
      it "アカウントの新規作成に成功すること" do
        fill_in "メールアドレス", with: "iamauser@example.con"
        fill_in "パスワード", with: "iamauser"
        fill_in "確認用パスワード", with: "iamauser"
        click_button "アカウント作成"
        expect(page).to have_content "アカウント登録が完了しました。"
      end
    end

    context "既に登録されている情報を入力した場合" do
      it "アカウントの新規作成に失敗すること" do
        fill_in "メールアドレス", with: "testuser@example.com"
        fill_in "パスワード", with: "iamauser"
        fill_in "確認用パスワード", with: "iamauser"
        click_button "アカウント作成"
        expect(page).to have_content "メールアドレスはすでに存在します"
      end
    end

    context "パスワードを6文字以下で入力した場合" do
      it "アカウントの新規作成に失敗すること" do
        fill_in "メールアドレス", with: "iamauser@example.con"
        fill_in "パスワード", with: "test"
        fill_in "確認用パスワード", with: "test"
        click_button "アカウント作成"
        expect(page).to have_content "パスワードは6文字以上で入力してください"
      end
    end

    context "パスワードと確認用パスワードに別の値を入力した場合" do
      it "アカウントの新規作成に失敗すること" do
        fill_in "メールアドレス", with: "iamauser@example.con"
        fill_in "パスワード", with: "testuser"
        fill_in "確認用パスワード", with: "iamauser"
        click_button "アカウント作成"
        expect(page).to have_content "確認用パスワードとパスワードの入力が一致しません"
      end
    end

    context "何も入力しなかった場合" do
      it "アカウントの新規作成に失敗すること" do
        fill_in "メールアドレス", with: " "
        fill_in "パスワード", with: " "
        fill_in "確認用パスワード", with: " "
        click_button "アカウント作成"
        expect(page).to have_content "メールアドレスを入力してください"
        expect(page).to have_content "パスワードを入力してください"
      end
    end
  end

  describe "パスワード再発行画面のテスト" do
    let!(:user) { create(:user, email: "testuser@example.com", password: "testuser") }

    before do
      visit new_user_password_path
    end

    context "登録されていないアドレスを入力した場合" do
      it "パスワードの再発行に失敗すること" do
        fill_in "メールアドレス", with: "missuser@example.com"
        click_button "パスワード再発行"
        expect(page).to have_content "メールアドレスは見つかりませんでした。"
      end
    end

    context "何も入力しなかった場合" do
      it "パスワードの再発行に失敗すること" do
        fill_in "メールアドレス", with: " "
        click_button "パスワード再発行"
        expect(page).to have_content "メールアドレスを入力してください"
      end
    end
  end
end
