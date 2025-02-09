require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができる場合' do
      it '全ての項目が適切に入力されていれば登録できる' do
        expect(@user).to be_valid
      end

      it 'first_nameが全角（漢字・ひらがな・カタカナ）で登録できる' do
        %w[山田 やまだ ヤマダ].each do |valid_name|
          @user.first_name = valid_name
          expect(@user).to be_valid
        end
      end

      it 'last_nameが全角（漢字・ひらがな・カタカナ）で登録できる' do
        %w[太郎 たろう タロウ].each do |valid_name|
          @user.last_name = valid_name
          expect(@user).to be_valid
        end
      end

      it 'first_name_kanaとlast_name_kanaが全角カタカナで登録できる' do
        @user.first_name_kana = 'ヤマダ'
        @user.last_name_kana = 'タロウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録ができない場合' do
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

      it 'emailが@を含まないと登録できない' do
        @user.email = 'testexample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it '重複したemailが存在する場合は登録できない' do
        FactoryBot.create(:user, email: 'test@example.com')
        @user.email = 'test@example.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが6文字未満では登録できない' do
        @user.password = 'a1b2c'
        @user.password_confirmation = 'a1b2c'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = 'differentpassword'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが半角数値のみの場合は登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英字と数字の両方を含めて入力してください')
      end

      it 'passwordが半角英字のみの場合は登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英字と数字の両方を含めて入力してください')
      end

      it 'passwordに全角文字が含まれている場合は登録できない' do
        @user.password = 'abc１２３'
        @user.password_confirmation = 'abc１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英字と数字の両方を含めて入力してください')
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

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'first_name_kanaがカタカナ以外では登録できない' do
        %w[やまだ 山田 ﾔﾏﾀﾞ].each do |invalid_name|
          @user.first_name_kana = invalid_name
          @user.valid?
          expect(@user.errors.full_messages).to include('First name kana カタカナで入力してください')
        end
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'last_name_kanaがカタカナ以外では登録できない' do
        %w[たろう 太郎 ﾀﾛｳ].each do |invalid_name|
          @user.last_name_kana = invalid_name
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name kana カタカナで入力してください')
        end
      end

      it '誕生日が空の場合は登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
