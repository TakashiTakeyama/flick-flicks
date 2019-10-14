require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    @user = create(:user)
  end

  it 'ログインできるかのテスト' do
    # ログイン画面へ
    click_button 'Login'
    visit new_user_session_path
    expect(page).to have_field
    # fill_in 'email', with: @user.email
    # fill_in 'password', with: @user.password
    # 郵便番号を入力
    # fill_in '郵便番号', with: '158-0083'
    # 住所が自動入力されたことを検証する
    # expect(page).to have_field '住所', with: '東京都世田谷区奥沢'

    # 更新実行

    # 正しく更新されていること（＝画面の表示が正しいこと）を検証する
    # expect(page).to have_content 'User was successfully updated.'
    # expect(page).to have_content 'いとう'
    # expect(page).to have_content '158-0083'
    # expect(page).to have_content '東京都世田谷区奥沢'
  end
end