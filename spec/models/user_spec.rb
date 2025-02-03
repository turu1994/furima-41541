require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  require 'rails_helper'

    before do
      @user = FactoryBot.build(:user)
    end
  
    describe 'ユーザー新規登録' do
      it '全ての項目が適切に入力されていれば登録できる' do
        expect(@user).to be_valid
      end
      
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
  
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
  
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
  
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = 'differentpassword'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
  
      it '重複したemailが存在する場合は登録できない' do
        FactoryBot.create(:user, email: 'test@example.com')  
        @user.email = 'test@example.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email has already been taken')
      end
  
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testexample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email メールアドレスの形式が無効です')
      end
  
      it 'passwordが6文字以下では登録できない' do
        @user.password = 'a1b2c'
        @user.password_confirmation = 'a1b2c'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
  
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
  
      it 'first_nameが半角では登録できない' do
        @user.first_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end
  
      it 'first_nameは全角（漢字）で登録できる' do
        @user.first_name = '山田'
        expect(@user).to be_valid
      end
  
      it 'first_nameは全角（ひらがな）で登録できる' do
        @user.first_name = 'やまだ'
        expect(@user).to be_valid
      end
  
      it 'first_nameは全角（カタカナ）で登録できる' do
        @user.first_name = 'ヤマダ'
        expect(@user).to be_valid
      end
  
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
  
      it 'last_nameが半角では登録できない' do
        @user.last_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
      end
  
      it 'last_nameは全角（漢字）で登録できる' do
        @user.last_name = '太郎'
        expect(@user).to be_valid
      end
  
      it 'last_nameは全角（ひらがな）で登録できる' do
        @user.last_name = 'たろう'
        expect(@user).to be_valid
      end
  
      it 'last_nameは全角（カタカナ）で登録できる' do
        @user.last_name = 'タロウ'
        expect(@user).to be_valid
      end
  
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
  
      it 'first_name_kanaが全角カタカナで登録できる' do
        @user.first_name_kana = 'ヤマダ'
        expect(@user).to be_valid
      end
  
      it 'first_name_kanaがひらがなでは登録できない' do
        @user.first_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana カタカナで入力してください')
      end
  
      it 'first_name_kanaが漢字では登録できない' do
        @user.first_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana カタカナで入力してください')
      end
  
      it 'first_name_kanaが半角カタカナでは登録できない' do
        @user.first_name_kana = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana カタカナで入力してください')
      end
  
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
  
      it 'last_name_kanaが全角カタカナで登録できる' do
        @user.last_name_kana = 'タロウ'
        expect(@user).to be_valid
      end
  
      it 'last_name_kanaがひらがなでは登録できない' do
        @user.last_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana カタカナで入力してください')
      end
  
      it 'last_name_kanaが漢字では登録できない' do
        @user.last_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana カタカナで入力してください')
      end
  
      it 'last_name_kanaが半角カタカナでは登録できない' do
        @user.last_name_kana = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana カタカナで入力してください')
      end
    end
end
