FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { Faker::Name.last_name_kanji }
    first_name { Faker::Name.first_name_kanji }
    last_name_kana { Faker::Name.last_name_katakana }
    first_name_kana { Faker::Name.first_name_katakana }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end