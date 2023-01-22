class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  def index
    @items = Item.all.order(created_at: :desc)
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

  def show
    
  end

  def edit
    if current_user.id != @item.user_id
      redirect_to root_path
      end
    end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
   @item.destroy
   redirect_to root_path
  end
end




    private
    def item_params
      params.require(:item).permit(:name, :price, :description, :condition_id, :delivery_id, :shipping_id, :prefecture_id,
                                   :category_id, :image).merge(user_id: current_user.id)
    end

    def set_item
    @item = Item.find(params[:id])
   end
end

