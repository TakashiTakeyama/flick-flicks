require 'rails_helper'

RSpec.describe 'Movies', type: :system do
  before do
    @category = create(:category)
    @user = create(:user)
    visit new_user_session_path
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    click_button 'Log in'
  end

  it 'Movieを作成できるかのテスト' do
    visit new_movie_path
    fill_in 'movie_title', with: 'ロッキー１'
    select 'Amazon_Prime', from: 'movie_watched_by'
    attach_file 'movie_image', "#{Rails.root}/spec/support/octo.png"
    click_button 'Registration'
    expect(page).to have_content 'ロッキー１'
  end

  it 'MovieにCategoryが保存できるかのテスト' do
    visit new_movie_path
    fill_in 'movie_title', with: 'ロッキー１'
    select 'Amazon_Prime', from: 'movie_watched_by'
    attach_file 'movie_image', "#{Rails.root}/spec/support/octo.png"
    check 'movie_category_ids_1'
    click_button 'Registration'
    visit movie_path(1)
    expect(page).to have_content 'ロッキー１'
  end

  it 'タイトル検索が機能しているかのテスト' do
    create(:movie)
    create(:second_movie)
    create(:third_movie)
    visit movies_path
    expect(page).to have_content 'ロッキー１'
    expect(page).to have_content 'ロッキー２'
    expect(page).to have_content 'ロッキー３'
    fill_in 'q_title_cont', with: 'ロッキー１'
    click_button '検索'
    expect(page).to have_content 'ロッキー１'
    expect(page).to_not have_content 'ロッキー２'
    expect(page).to_not have_content 'ロッキー３'
  end

  context 'テストの為のmovieを作成' do
    let!(:movie) { create(:movie) }
    it 'movieに対してお気に入り登録ができるかのテスト' do
      visit movie_path(movie)
      click_link 'Good!'
      expect(page).to have_content 'お気に入り登録しました'
    end

    it 'movieに対してお気に入り登録が解除できるかのテスト' do
      visit movie_path(movie)
      click_link 'Good!'
      visit movie_path(movie)
      click_link 'Bad'
      expect(page).to have_content 'お気に入り解除しました'
    end
  end
end
