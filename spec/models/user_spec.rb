require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "全ての項目が正しければ登録できる" do

      end
    end

    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do

      end
      it "emailが空では登録できない" do

      end
      it "passwordが空では登録できない" do

      end
      it "first_nameが空では登録できない" do

      end
      it "last_nameが空では登録できない" do

      end
      it "first_name_kanaが空では登録できない" do

      end
      it "last_name_kanaが空では登録できない" do

      end
      it "birth_dateが空では登録できない" do

      end
      #ここまで空テスト
      #ここから文字種類、文字数テスト
      it "passwordが数字だけでは登録できない" do

      end
      it "passwordが英字では登録できない" do

      end
      it "passwordが6文字以内では登録できない" do

      end
      it "passwordが129文字以上では登録できない" do

      end
      it "first_nameが英字では登録できない" do

      end
      it "last_nameが英字では登録できない" do

      end
      it "first_name_kanaが漢字では登録できない" do

      end
      it "last_name_kanaが漢字では登録できない" do

      end
      it "first_name_kanaがひらがなでは登録できない" do

      end
      it "last_name_kanaがひらがなでは登録できない" do

      end
      it "first_name_kanaが英字では登録できない" do

      end
      it "last_name_kanaが英字では登録できない" do

      end
      
    end
  end

end
