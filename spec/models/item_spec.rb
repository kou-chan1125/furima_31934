require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品がうまく行くとき' do
      it 'prise_name、description、category_id、condition_id、deli_fee_id、
          area_id、deli_day_id、priceの情報が正しく入力されている' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまく行かないとき' do
      it 'prise_nameが空のとき' do
        @item.prise_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prise name can't be blank")
      end
      it 'descriptionが空のとき' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空のとき' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空のとき' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'deli_fee_idが空のとき' do
        @item.deli_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Deli fee can't be blank")
      end
      it 'deli_day_idが空のとき' do
        @item.deli_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Deli day can't be blank")
      end
      it 'area_idが空のとき' do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it 'priceが空のとき' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'imageが空のとき' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'prise_nameが10文字より多いとき' do
        @item.prise_name = 'テストテストテストテス'
        @item.valid?
        expect(@item.errors.full_messages).to include('Prise name is too long (maximum is 10 characters)')
      end
      it 'descriptionが1000文字より多いとき' do
        @item.description = (Faker::Base.regexify('[テスト]{1001}'))
        @item.valid?
        expect(@item.errors.full_messages).to include('Description is too long (maximum is 1000 characters)')
      end
      it 'priceが300より少ないとき' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end
      it 'priceが9999999より多いとき' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceが半角数字でないとき' do
        @item.price = 'test'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'category_idが1の時保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'condition_idが1の時保存できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it 'deli_fee_idが1の時保存できない' do
        @item.deli_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Deli fee must be other than 1')
      end
      it 'area_idが1の時保存できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Area must be other than 1')
      end
      it 'deli_day_idが1の時保存できない' do
        @item.deli_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Deli day must be other than 1')
      end      
    end
  end
end
