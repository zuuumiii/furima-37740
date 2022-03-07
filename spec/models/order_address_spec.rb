require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe "商品購入" do
    before do
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: item.user_id, item_id: item.id)
      sleep 0.1
    end

    context "購入ができる場合" do
      it "全てが正しく入力されている場合" do
        expect(@order_address).to be_valid
      end
      it "buildingは空でも登録できる" do
        @order_address.building = ""
        expect(@order_address).to be_valid
      end
    end


    context "購入ができない場合" do
      it "psotal_codeが空だと登録できない" do
        @order_address.postal_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it "prefecture_idが未選択だと登録できない" do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture 選択してください")
      end
      it "cityが空だと登録できない" do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空だと登録できない" do
        @order_address.address = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it "phoneが空だと登録できない" do
        @order_address.phone = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
      end
      it "tokenが空だと登録できない" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      #ここまで空テスト
      #ここから文字制限テスト

      it "psotal_codeがハイフン無しだと登録できない" do
        @order_address.postal_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code - を含み正しく入力してください。")
      end
      it "psotal_codeが3桁-4桁でないとだと登録できない" do
        @order_address.postal_code = "1234-567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code - を含み正しく入力してください。")
      end
      it "phoneが9桁以下では登録できない" do
        @order_address.phone = "123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone - 無しで数字のみ入力してください。")
      end
      it "phoneが12桁以上では登録できない" do
        @order_address.phone = "123456789012"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone - 無しで数字のみ入力してください。")
      end
      it "phoneがハイフンを入れると登録できない" do
        @order_address.phone = "090-1234-5678"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone - 無しで数字のみ入力してください。")
      end


    end
  end
end
