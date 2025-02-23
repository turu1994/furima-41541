class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id]) 
  end
  
  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id]) 
    if  @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.permit(:user_id, :item_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def address_params
    params.permit(:postal_code, :location_id, :city, :address, :building, :phone).merge(order_id: @order.id)
  end
end