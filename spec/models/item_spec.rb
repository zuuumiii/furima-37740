require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '新規登録できる場合' do
      it '全ての項目が正しければ登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録できない場合' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'infoが空では登録できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'category_idが未選択では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category 選択してください')
      end
      it 'status_idが未選択では登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status 選択してください')
      end
      it 'shipping_fee_idが未選択では登録できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee 選択してください')
      end
      it 'prefecture_idが未選択では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture 選択してください')
      end
      it 'schedule_idが未選択では登録できない' do
        @item.schedule_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Schedule 選択してください')
      end
      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      # ここまで空テスト
      # ここから文字種類、文字数テスト
      it 'nameが40文字以上では登録できない' do
        @item.name = ('a' * 41).to_s
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end
      it 'infoが1000文字以上では登録できない' do
        @item.info = ('a' * 1001).to_s
        @item.valid?
        expect(@item.errors.full_messages).to include('Info is too long (maximum is 1000 characters)')
      end
      it 'priceが半角数字以外では登録できない' do
        @item.price = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが300以下では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが9999999以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'ユーザーが紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
