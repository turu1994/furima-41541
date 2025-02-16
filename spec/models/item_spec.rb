require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品が出品できる場合' do
      it '必要な情報を全て正しく入力すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it '商品画像が添付されていないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空だと保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が空だと保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーが「---」だと保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品の状態が「---」だと保存できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it '配送料の負担が「---」だと保存できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
      end

      it '発送元の地域が「---」だと保存できない' do
        @item.location_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Location must be other than 1")
      end

      it '発送までの日数が「---」だと保存できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
      end

      it '価格が空だと保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      

      it '価格が¥300未満または¥9,999,999を超えると保存できない' do
        invalid_prices = [299, 10_000_000] # 299円（下限未満）と10,000,000円（上限超え）
      
        invalid_prices.each do |price|
          @item.price = price
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be between ¥300 and ¥9,999,999")
        end
      end  
      it '価格が半角数字でなければ保存できない' do
        invalid_prices = ['１０００', '１２３', '1a23', 'abc', '123abc', '￥1000'] # 全角・記号含む

        invalid_prices.each do |price|
          @item.price = price
          @item.valid?
          expect(@item.errors.full_messages).to include('Price は半角数字で入力してください'), "Failed with price: #{price}"
        end
      end

      it 'ユーザーが紐づいていなければ保存できない' do
        @item.user = nil 
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      

    end
  end
end