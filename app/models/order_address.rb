class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :location_id, :city, :address, :building, :phone, :item_id, :user_id, :token
  #バリデーション
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :location_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone, format: { with: /\A\d{10,11}\z/, message: "is invalid" }
    validates :item_id
    validates :user_id
    validates :token
  end
   
  # 購入情報の保存
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, location_id: location_id, city: city, address: address, building: building, phone: phone, order_id: order.id)
  end

end