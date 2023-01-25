class OrdersController < ApplicationController

  before_action :set_item, only: [:index, :create]
  def index
  
  end

  def create
    @order_payment= OrderPayment.new(order_params)
    if @order_payment.valid?
      @order_payment.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_payment).permit(:post_code, :prefecture_id, :city, :block, :building, :phpne_number)
    .merge(user_id: current_user.id, item_id: @item_id, token: params[:token]) 
end

def pay_item
  Payjp.api_key = "sk_test_aa096b6a4fbccbeb4d714535"
  Payjp::Charge.create(
    amount: @item.price,
    card: order_payment_params[:token],
    currency: 'jpy'
  )
end
end
