require 'rails_helper'

RSpec.describe 'Categoryモデル', type: :system do
  context 'Categoryモデルのバリデーション確認' do
    it "nameのpresenceのテスト" do
      category = Category.new(
      )
      expect(category).not_to be_valid
    end

    it "nameの一意性のテスト" do
      @category = create(:category)
      category = Category.new(
        name: @category.name,
      )
      expect(category).not_to be_valid
    end

    it "nameのlengthのテスト" do
      category = Category.new(
        name: 'a'*16,
      )
      expect(category).not_to be_valid
    end
  end
end