class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :schedule

  validates :name, presence: true, length: {maximum: 40}
  validates :info, presence: true, length: {maximum: 1000}
  validates :image, presence: true
  validates :price,  presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  with_options numericality: { other_than: 1, message: "選択してください" } do
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :schedule_id
  end
 
end
