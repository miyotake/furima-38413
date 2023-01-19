class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update]

  def index
  end

  def new
   @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
    private
    def item_params
      params.require(:item).permit(:name, :price, :description, :condition_id, :delivery_id, :shipping_id, :prefecture_id,
                                   :category_id, :image).merge(user_id: current_user.id)
    end

    def move_to_index
      if current_user.id != @item.user_id
        redirect_to root_path
      elsif !@item.order.nil?
        redirect_to root_path
      end
end
end

