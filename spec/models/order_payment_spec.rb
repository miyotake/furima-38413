require 'rails_helper'

RSpec.describe OrderPayment, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_payment = FactoryBot.build(:order_payment, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_payment).to be_valid
      end
      it '建物名が空でも保存できる' do
        @order_payment.building = nil
        expect(@order_payment).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @order_payment.user_id = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order_payment.item_id = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できない' do
        @order_payment.post_code = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @order_payment.post_code = 1_234_567
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '都道府県が「---」だと保存できないこと' do
        @order_payment.prefecture_id = 0
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が空だと保存できないこと' do
        @order_payment.prefecture_id = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @order_payment.city = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @order_payment.block = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Block can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @order_payment.phone_number = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @order_payment.phone_number = '123-4567-8900'
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @order_payment.phone_number = 12_345_678_910_123
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it '電話番号が9桁以下だと保存できないこと' do
        @order_payment.phone_number = 123_456_789
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include('Phone number is invalid')
      end
      it 'トークンが空だと保存できないこと' do
        @order_payment.token = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
