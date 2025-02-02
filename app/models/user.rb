class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   # ニックネームのバリデーション
   validates :nickname, presence: true

   # メールアドレスのバリデーション
   validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'メールアドレスの形式が無効です' }
   # パスワードは6文字以上
   # パスワードのバリデーション（deviseが提供するもの）
   validates :password, presence: true, length: { minimum: 6 }
   validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*[0-9])/, message: 'は英字と数字の両方を含めて入力してください' }
 
   # パスワードと確認パスワードの一致チェック（deviseが提供）
   validates :password, confirmation: true
 
   # お名前(全角)のバリデーション（名字と名前は必須、全角での入力が必須）
   with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end
  
 
   # お名前カナ(全角)のバリデーション（名字と名前は必須、全角カタカナでの入力が必須）
   with_options presence: true, format: { with: /\A[ァ-ンー]+\z/, message: 'カタカナで入力してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end
  
 
   # 生年月日のバリデーション
   validates :birth_date, presence: true       
end
