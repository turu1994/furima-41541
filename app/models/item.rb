class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions  
  belongs_to :user
  has_one_attached :image
  
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_day
  
  # バリデーション
  validates :image, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  with_options presence: true, numericality: { other_than: 1, message: "を選択してください" } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :location_id
    validates :shipping_day_id
  end
  validates :price, presence: true, 
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "は¥300〜¥9,999,999の範囲で入力してください" }
end