class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
<<<<<<< HEAD
    #@items = Item.includes(:user).all
  end 

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params) 
    if @item.save  
      redirect_to items_path, notice: "商品を出品しました"
    else
      render :new, status: :unprocessable_entity 
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shipping_fee_id, :location_id, :shipping_day_id, :price)
  end
  

=======
    #@items = Item.all
  end
>>>>>>> parent of f396a42 (商品出品機能)
end
