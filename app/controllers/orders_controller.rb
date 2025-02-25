class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :redirect_if_invalid_access

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new
  end
  
  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :location_id, :city, :address, :building, :phone)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],  
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_invalid_access
    if @item.order.present? && current_user.id != @item.user_id
      redirect_to root_path, alert: "この商品はすでに売却済みです。"
    end

    if current_user.id == @item.user_id
      redirect_to root_path, alert: "自身が出品した商品は購入できません。"
    end
  end
end
