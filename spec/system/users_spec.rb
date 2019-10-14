# require 'rails_helper'
#
# RSpec.describe 'Users', type: :system do
#   before do
#     @user = create(:user)
#   end
#
#   it 'サインアップできるかどうかのテスト' do
#     visit new_user_registration_path
#     fill_in 'user_name', with: 'takashi'
#     fill_in 'email', with: 'takashi@gmail.com'
#     fill_in 'user_nick_name', with: 'take'
#     attach_file 'user_icon', "#{Rails.root}/spec/support/octo.png"
#     fill_in 'user_password', with: 'aaaaaa'
#     fill_in 'user_password_confirmation', with: 'aaaaaa'
#     click_on 'Sign in'
#     expect(page).to_not have_field 'SignUp'
#   end
#
#   it 'ログインできるかのテスト' do
#     visit new_user_session_path
#     fill_in 'email', with: @user.email
#     fill_in 'password', with: @user.password
#     click_button 'Log in'
#     expect(page).to_not have_field 'LogIn'
#   end
# end