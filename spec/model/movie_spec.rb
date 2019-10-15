require 'rails_helper'

RSpec.describe 'Movieモデル', type: :system do
  context 'Movieモデルのバリデーション確認' do
  let!(:image_sample) { File.join(Rails.root, 'spec/support/octo.png') }
    it "titleとimageのpresenceのテスト" do
      movie = Movie.new(
      )
      expect(movie).not_to be_valid
    end

    it "titleの一意性のテスト" do
      @movie = create(:movie)
      movie = Movie.new(
                     title: @movie.title,
                     image: image_sample
      )
      expect(movie).not_to be_valid
    end

    it "titleのlengthのテスト" do
      movie = Movie.new(
        title: 'a'*31,
        image: image_sample
      )
      expect(movie).not_to be_valid
    end
  end
end