class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'レディース' },
    { id: 3, name: 'メンズ' },
    { id: 4, name: 'ベビーグッズ本・音楽・ゲーム' },
    { id: 5, name: 'おもちゃ・ホビー・グッズ' },
    { id: 6, name: '家電・スマホ・カメラ' },
    { id: 7, name: 'スポーツ・レジャー' },
    { id: 8, name: 'ハンドメイド' },
    { id: 9, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :items
end
