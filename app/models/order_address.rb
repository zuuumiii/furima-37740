calss OrderAddress
 include ActiveModel::Model
  attr_accessor :psotal_code, :prefecture_id, :city, :address, :building, :phone, :user_id, :item_id

  with_ooptions presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "- を含み正しく入力してください。"}
    validates :city
    validates :address
    validates :phone
  end
  validates :prefecture_id, numericality: { other_than: 1, message: '選択してください' }

  def save
    order = Order.create(usre_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone: phone, order_id: order.id)
  end
end
