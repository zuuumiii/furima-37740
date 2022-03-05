class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  belongs_to :category


  validates :name, :info, :price,  presence: true
  validates :category_id, numericality: { other_than: 1, message: "選択してください" } 
end
