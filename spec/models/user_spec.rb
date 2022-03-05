require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "全ての項目が正しければ登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "birth_dateが空では登録できない" do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
      #ここまで空テスト
      #ここから文字種類、文字数テスト
      it "passwordが既に使われていると登録できない" do
        @user.save
        @user2 = FactoryBot.build(:user)
        @user2.save
        @user.email = @user2.email
        @user.valid?
        expect(@user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが数字だけでは登録できない" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 英字数字両方を使用してください")
      end
      it "passwordが英字では登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 英字数字両方を使用してください")
      end
      it "passwordが6文字以内では登録できない" do
        @user.password = "a1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが129文字以上では登録できない" do
        @user.password = "#{'a1'* 64}a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it "first_nameが英字では登録できない" do
        @user.first_name = "Einstein"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it "last_nameが英字では登録できない" do
        @user.last_name = "Albert"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      it "first_name_kanaが漢字では登録できない" do
        @user.first_name_kana = "田中"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カタカナを使用してください")
      end
      it "last_name_kanaが漢字では登録できない" do
        @user.last_name_kana = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カタカナを使用してください")
      end
      it "first_name_kanaがひらがなでは登録できない" do
        @user.first_name_kana = "たなか"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カタカナを使用してください")
      end
      it "last_name_kanaがひらがなでは登録できない" do
        @user.last_name_kana = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カタカナを使用してください")
      end
      it "first_name_kanaが英字では登録できない" do
        @user.first_name_kana = "Einstein"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カタカナを使用してください")
      end
      it "last_name_kanaが英字では登録できない" do
        @user.last_name_kana = "Albert"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カタカナを使用してください")
      end
      
    end
  end

end
