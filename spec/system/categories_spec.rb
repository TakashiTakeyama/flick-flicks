require 'rails_helper'

RSpec.describe 'Categories', type: :system do
  before do
    @user = create(:user)
    visit new_user_session_path
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    click_button 'Log in'
  end

  it 'Categoryを作成できるかのテスト' do
    visit new_category_path
    fill_in 'category_name', with: 'アクション'
    click_button 'Create'
    visit new_movie_path
    expect(page).to have_content 'アクション'
  end
end