class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery
  belongs_to :shipping

  validates :name, :description, :price, :image, presence: true
  validates :condition_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :category_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :delivery_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :shipping_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :image, presence: true
  validates :price, numericality: { less_than_or_equal_to: 9_999_999, greater_than_or_equal_to: 300, only_integer: true }
end
