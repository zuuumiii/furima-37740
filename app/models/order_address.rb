class OrderAddress
 include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "- を含み正しく入力してください。"}
    validates :city
    validates :address
    validates :phone, format: {with: /\A\d{10}$|^\d{11}\z/, message: "- 無しで数字のみ入力してください。"}
  end
  validates :prefecture_id, numericality: { other_than: 1, message: '選択してください' }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone: phone, order_id: order.id)
  end
end
