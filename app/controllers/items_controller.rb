class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only:[:show, :edit, :update, :destroy]
  before_action :move_to_index, only:[:edit, :update, :destroy]

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
    if current_user.id != @item.user_id && @item.order.nil?
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
    else 
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
   
   
  def move_to_index
    if @item.user_id != current_user.id || @item.order != nil
      redirect_to action: :index
    end
  end
end

