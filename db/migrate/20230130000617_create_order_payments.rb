class CreateOrderPayments < ActiveRecord::Migration[6.1]
  def change
    create_table :order_payments do |t|

      t.timestamps
    end
  end
end
