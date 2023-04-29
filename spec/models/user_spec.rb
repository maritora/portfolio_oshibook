require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "バリデーションのテスト" do
    it "メールアドレス、パスワード、ユーザー名があれば有効な状態であること" do
      expect(@user).to be_valid
    end

    it "メールアドレスがなければ無効な状態であること" do
      @user.email = ""
      @user.valid?
      expect(@user.errors[:email]).to include("を入力してください")
    end

    it "ユーザー名がなければ無効な状態であること" do
      @user.name = ""
      @user.valid?
      expect(@user.errors[:name]).to include("を入力してください")
    end

    it "ユーザー名が10文字以下でなければ無効であること" do
      @user.name = "a" * 11
      @user.valid?
      expect(@user.errors[:name]).to include("は10文字以内で入力してください")
    end
    it "パスワードが6文字以上でなければ無効であること" do
      @user.password = "a" * 5
      @user.valid?
      expect(@user.errors[:password]).to include("は6文字以上で入力してください")
    end

    it "重複したメールアドレスなら無効な状態であること" do
      FactoryBot.create(:user)
      @user.valid?
      expect(@user.errors[:email]).to include("はすでに存在します")
    end
  end
end
