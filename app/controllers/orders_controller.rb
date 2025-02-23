class OrdersController < ApplicationController
  def index
    @order = Order.new
  end
  
  def create
    @order = Order.new(order_params)
    if @order.save
      Address.create(address_params)
      redirect_to root_path
    else
      render :index
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