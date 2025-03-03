# app/models/scheduled_delivery.rb
class ShippingDay < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1~2日で発送' },
    { id: 3, name: '3~4日で発送' },
    { id: 4, name: '4~7日で発送' }
  ]
  include ActiveHash::Associations
  has_many :items
end
