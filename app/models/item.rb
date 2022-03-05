class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee

  validates :name, :info, :price,  presence: true
  validates :category_id, numericality: { other_than: 1, message: "選択してください" } 
  validates :status_id, numericality: { other_than: 1, message: "選択してください" } 
  validates :shipping_fee_id, numericality: { other_than: 1, message: "選択してください" } 
end