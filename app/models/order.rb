class Order < ApplicationRecord
  belongs_to :user
  has_one    :payment
  belongs_to :item
end
