class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.string  :post_code                   ,null: false
      t.integer :prefecture_id                 ,null: false
      t.string  :city          ,null: false
      t.string  :block ,null: false
      t.string  :building 
      t.string  :phone_number  ,null: false

      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
