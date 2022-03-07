require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe "商品購入" do
    before do
      user = FactoryBot.create(:user)
      @order_address = FactoryBot.build(:order_address, user_id: user.id)
    end

    context "購入ができる場合" do
      it "全てが正しく入力されている場合" do

      end
      it "buildingは空でも登録できる" do

      end
    end


    context "購入ができない場合" do
      it "psotal_codeが空だと登録できない" do

      end
      it "prefecture_idが未選択だと登録できない" do

      end
      it "cityが空だと登録できない" do

      end
      it "addressが空だと登録できない" do

      end
      it "phoneが空だと登録できない" do

      end
      it "tokenが空だと登録できない" do

      end
      #ここまで空テスト
      #ここから文字制限テスト

      it "psotal_codeがハイフン無しだと登録できない" do

      end
      it "psotal_codeが3桁-4桁でないとだと登録できない" do

      end
      it "phoneが9桁以下では登録できない" do

      end
      it "phoneが12桁以上では登録できない" do

      end
      it "phoneがハイフンを入れると登録できない" do

      end


    end
  end
end
