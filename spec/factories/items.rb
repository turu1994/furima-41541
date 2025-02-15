FactoryBot.define do
  factory :item do
    name { "テスト商品" }
    description { "これはテスト商品です" }
    category_id { 2 }
    condition_id { 2 }
    shipping_fee_id { 2 }
    location_id { 2 }
    shipping_day_id { 2 }
    price { 1000 }
    association :user  
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
