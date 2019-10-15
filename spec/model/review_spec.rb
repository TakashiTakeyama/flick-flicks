require 'rails_helper'

RSpec.describe 'Reviewモデル', type: :system do
  context 'Reviewモデルのバリデーション確認' do
    before "userモデルの作成" do
      @user = create(:user)
      @movie = create(:movie)
    end
    it "impressionの存在性のテスト" do
      @review = create(:review)
      review = Review.new(
        )
      expect(review).not_to be_valid
    end

    it "impressionのlengthのテスト" do
      review = Review.new(
        impression: 'a'*1001,
        )
      expect(review).not_to be_valid
    end
  end
end