class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update]  
  before_action :authenticate_user!, except: [:index, :show]
  before_action :redirect_unless_owner, only: [:edit, :update]


  def index
    @items = Item.all.order(created_at: :desc)
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)  
      redirect_to item_path(@item), notice: "商品情報を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)  
      redirect_to item_path(@item), notice: "商品情報を更新しました"
    else
      render :edit, status: :unprocessable_entity  
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shipping_fee_id, :location_id, :shipping_day_id, :price)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect_unless_owner
    if @item.user_id != current_user.id
      redirect_to root_path, alert: "この商品は編集できません。"
    end
  end
    unless current_user.id == @item.user_id
      redirect_to root_path, alert: "編集権限がありません。"
    end
  end
  

end
