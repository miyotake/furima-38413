class OrderPayment < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :block, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id

    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\d{10,11}/ }, length: { maximum: 11 }

    validates :token
  end
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Payment.create(order_id: order.id, post_code: post_code, prefecture_id: prefecture_id,
                   city: city, block: block, building: building, phone_number: phone_number)
  end
end
