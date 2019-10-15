require 'rails_helper'

RSpec.describe 'Reviws', type: :system do
  before do
    @movie = create(:movie)
    @user = create(:user)
    @second_user = create(:second_user)
    @review = create(:review)
    visit new_user_session_path
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    click_button 'Log in'
  end

  it 'reviewを作成できるかのテスト' do
    visit new_review_path(@movie)
    fill_in 'review_impression', with: 'review_test'
    click_button 'POST'
    expect(page).to have_content 'review_test'
  end

  context 'second_user作成' do
    let!(:second_user) { create(:second_user) }
    it 'reviewに対してお気に入り登録ができるかのテスト' do
      visit review_path(@review)
      click_link 'good'
      expect(page).to have_content 'レビューをお気に入り登録しました'
    end
  end

  it 'reviewに対してお気に入り登録が解除できるかのテスト' do
    visit review_path(@review)
    click_link 'good'
    visit review_path(@review)
    click_link 'bad'
    expect(page).to have_content 'レビューをお気に入り解除しました'
  end
end
