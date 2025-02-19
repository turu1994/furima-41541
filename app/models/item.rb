class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions  
  belongs_to :user
  has_one_attached :image
  
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :location
  belongs_to :shipping_day
  
  # バリデーション
  validates :image, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  with_options presence: true, numericality: { other_than: 1, message: "must be other than 1" } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :location_id
    validates :shipping_day_id
  end
  validates :price, presence: true
  validates :price, numericality: { 
    only_integer: true, 
    greater_than_or_equal_to: 300, 
    less_than_or_equal_to: 9_999_999, 
    message: "must be between ¥300 and ¥9,999,999" 
  }
  validates :price, presence: true, numericality: { only_integer: true, message: 'は半角数字で入力してください' }

  
end