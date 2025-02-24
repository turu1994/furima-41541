require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.build_stubbed(:user)  # DBに保存せずメモリ上で作成
    @item = FactoryBot.build_stubbed(:item)  
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入' do
    context '決済が出来る' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end

      it '建物名は空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '決済が出来ない' do
      it 'クレジットカード情報が空だと決済できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空だと保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号が「3桁-4桁」の形式でないと保存できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '都道府県が未選択（1）だと保存できないこと' do
        @order_address.location_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Location can't be blank")
      end

      it '市区町村が空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと保存できないこと' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空だと保存できないこと' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
      end

      it '電話番号が9桁以下では購入できない' do
        @order_address.phone = '123456789' 
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end
      
      it '電話番号が12桁以上では購入できない' do
        @order_address.phone = '123456789012' 
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end
      

      it '電話番号が半角数字でないと保存できないこと' do
        @order_address.phone = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end

      it 'user_id が紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_id が紐付いていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end

end
