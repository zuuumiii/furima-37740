require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe "商品購入" do
    before do
      user = FactoryBot.create(:user)
      @order_address = FactoryBot.build(:order_address, user_id: user.id)
    end
  end
end
