Faker::Config.locale = :ja

FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    last_name_kana { 'タナカ' } # カタカナの名前を指定
    first_name_kana { 'タロウ' } # カタカナの名前を指定
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end