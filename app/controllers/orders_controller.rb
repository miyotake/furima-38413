class OrdersController < ApplicationController

  before_action :set_item, only: [:index, :create]
  def index
   
    @order_payment = OrderPayment.new
   
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
    params.require(:order_payment).permit(:post_code, :prefecture_id, :city, :block, 
                               :building, :phone_number)
                           .merge(user_id: current_user.id, item_id: @item_id, token: params[:token]) 
end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
 end
end
