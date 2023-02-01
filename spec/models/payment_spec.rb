require 'rails_helper'

RSpec.describe Payment, type: :model do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @payment = FactoryBot.build(:payment, user_id: user.id, item_id: item.id)
      sleep 0.1 #インスタンス作成に待機時間を確保#
    end
  
    describe "商品の購入機能" do
      context "商品購入の入力が正しい時" do
        it "全ての値が正しく入力されていれば購入できる" do
          expect(@payment).to be_valid
        end
        it "建物名が空でも購入できる" do
          @payment.building = nil
          expect(@payment).to be_valid
        end
      end
  
      context "商品購入の入力が正しくない時" do
        it "郵便番号が空だと購入できない" do
          @payment.post_code = nil
          @payment.valid?
          expect(@payment.errors.full_messages).to include("Post code can't be blank")
        end
        it "郵便番号は3桁ハイフン4桁でないと購入できない" do
          @payment.post_code = "1234567"
          @payment.valid?
          expect(@payment.errors.full_messages).to include("Post code is invalid")
        end
        it "郵便番号は全角文字列だと購入できない" do
          @payment.post_code = "１２３-４５６７"
          @payment.valid?
          expect(@payment.errors.full_messages).to include("Post code is invalid")
        end
        it "都道府県が未選択だと購入できない" do
          @order.prefecture_id = "1"
          @payment.valid?
          expect(@payment.errors.full_messages).to include("Prefecture_id can't be blank")
        end
        it "市区町村が空だと購入できない" do
          @payment.city = nil
          @payment.valid?
          expect(@payment.errors.full_messages).to include("City can't be blank")
        end
        it "番地が空だと購入できない" do
          @payment.block = nil
          @payment.valid?
          expect(@payment.errors.full_messages).to include("Block can't be blank")
        end
        it "電話番号が空だと購入できない" do
          @payment.phone_number = nil
          @payment.valid?
          expect(@payment.errors.full_messages).to include("Phone number can't be blank")
        end
        it "電話番号が10桁未満だと購入できない" do
          @payment.phone_number = "090123456"
          @payment.valid?
          expect(@payment.errors.full_messages).to include("Phone number is invalid")
        end
        it "電話番号が12桁以上だと購入できない" do
          @payment.phone_number = "090123456789"
          @payment.valid?
          expect(@payment.errors.full_messages).to include("Phone number is invalid")
        end
        it "電話番号が全角文字列だと購入できない" do
          @payment.phone_number = "０９０１２３４５６７８"
          @payment.valid?
          expect(@payment.errors.full_messages).to include("Phone number is invalid")
        end
        it "電話番号にハイフンが入ると購入できない" do
          @payment.phone_number = "090-1234-56"
          @payment.valid?
          expect(@payment.errors.full_messages).to include("Phone number is invalid")
        end
        it "クレジット情報のtokunが生成されていないと購入できない" do
          @payment.token = nil
          @payment.valid?
          expect(@payment.errors.full_messages).to include("Token can't be blank")
        end
        it "User情報と紐付いていないと購入できない" do
          @payment.user_id = nil
          @payment.valid?
          expect(@payment.errors.full_messages).to include("User can't be blank")
        end
        it "Item情報と紐付いていないと購入できない" do
          @payment.item_id = nil
          @payment.valid?
          expect(@payment.errors.full_messages).to include("Item can't be blank")
        end
      end
    end
  end

