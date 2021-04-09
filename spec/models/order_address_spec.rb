require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address,user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '商品出品機能' do
    context '商品購入がうまく行くとき' do
      it 'user_id,item_id,postal_code,prefecture_id,municipality,house_num,building_name,
      tel_num,tokenの情報が正しく入力されている' do
        expect(@order_address).to be_valid
      end
      it 'building_nameが空でも保存できる' do
        @order_address.building_name = ""
        expect(@order_address).to be_valid
      end
    end
    context '商品購入がうまく行かないとき' do
      it 'user_idが空のとき' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空のとき' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'postal_codeが空のとき' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'municipalityが空のとき' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'house_numが空のとき' do
        @order_address.house_num = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House num can't be blank")
      end
      it 'tel_numが空のとき' do
        @order_address.tel_num = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel num can't be blank")
      end
      it 'tokenが空のとき' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが全角日本語でないと保存できないこと' do
        @order_address.municipality = 'shikutyouson'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Municipality is invalid. Input full-width characters.')
      end
      it 'building_nameは空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
      it 'tel_numが全角では保存できない' do
        @order_address.tel_num = '０１２３４５６７８９０'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel num is invalid')
      end
      it 'tel_numが12桁以上だと保存できない' do
        @order_address.tel_num = '012345678901'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel num is invalid')
      end
      it 'tel_numが9桁以下だと保存できない' do
        @order_address.tel_num = '012345678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel num is invalid')
      end
    end
  end
end
