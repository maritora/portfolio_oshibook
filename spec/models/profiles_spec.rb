require 'rails_helper'

RSpec.describe Profile, type: :model do 

  describe "バリデーションのテスト" do
  before do
    @profile = FactoryBot.build(:profile)
  end

  
    it "推しの名前の記載がなければ無効であること" do
      @profile.oshi_name = ""
      @profile.valid?
      expect(@profile.errors[:oshi_name]).to include("を入力してください")
    end
    it "推しの名前が10文字を超える場合エラーメッセージが出ること" do
      @profile.oshi_name = "a" * 11
      @profile.valid?
      expect(@profile.errors[:oshi_name]).to include("は10文字以内で入力してください")
    end
    
    it "callの記載がなければ無効であること" do
      @profile.call = ""
      @profile.valid?
      expect(@profile.errors[:call]).to include("を入力してください")
    end
    it "callが10文字を超える場合エラーメッセージが出ること" do
      @profile.call = "a" * 11
      @profile.valid?
      expect(@profile.errors[:call]).to include("は10文字以内で入力してください")
    end

    it "job名前の記載がなければ無効であること" do
      @profile.job = ""
      @profile.valid?
      expect(@profile.errors[:job]).to include("を入力してください")
    end
    it "jobが20文字を超える場合エラーメッセージが出ること" do
      @profile.job = "a" * 21
      @profile.valid?
      expect(@profile.errors[:job]).to include("は20文字以内で入力してください")
    end

    it "favorite_point名前の記載がなければ無効であること" do
      @profile.favorite_point = ""
      @profile.valid?
      expect(@profile.errors[:favorite_point]).to include("を入力してください")
    end
    it "favorite_pointが20文字を超える場合エラーメッセージが出ること" do
      @profile.favorite_point = "a" * 21
      @profile.valid?
      expect(@profile.errors[:favorite_point]).to include("は20文字以内で入力してください")
    end

    it "公開・非公開の選択がなければ無効であること" do
      @profile.is_published_flag = ""
      @profile.valid?
      expect(@profile.errors[:is_published_flag]).to include("は必須項目です")
    end
  end
end
