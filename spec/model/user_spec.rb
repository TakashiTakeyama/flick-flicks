require 'rails_helper'

RSpec.describe 'User', type: :system do
  describe 'バリデーション確認' do
    context 'Userモデルのバリデーション確認' do
      let!(:user1) { create(:user) }
      it "nameとemailのpresenceのテスト" do
        user = User.new(
        )
        expect(user).not_to be_valid
      end

      it "nameのlengthのテスト" do
        user = User.new(
                     name: 'a'*31,
                     email: user1.email
        )
        expect(user).not_to be_valid
      end

      it "emailの一意性のテスト" do
        @user = create(:user)
        user = User.new(
                     name: "takashi",
                     email: @user.email
        )
        expect(user).not_to be_valid
      end
      it "emailと正規表現とlengthのテスト" do
        user = User.new(
                     name: "takashi",
                     email: "a"*31
        )
        expect(user).not_to be_valid
      end
    end
  end
end
