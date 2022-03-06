calss OrderAddress
 include ActiveModel::Model
  attr_accessor :psotal_code, :prefecture_id, :city, :address, :building, :phone

  with_ooptions presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "- を含み正しく入力してください。"}
    validates :city
    validates :address
    validates :phone
  end
  validates :prefecture_id, numericality: { other_than: 1, message: '選択してください' }
end
