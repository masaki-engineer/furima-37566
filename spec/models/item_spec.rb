require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できるとき' do
      it '全項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できないとき' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'infoが空では登録できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'categoryが選択されていないと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'sales_statusが選択されていないと登録できない' do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank")
      end
      it 'shipping_fee_statusが選択されていないと登録できない' do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end
      it 'prefectureが選択されていないと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'scheduled_deliveryが選択されていないと登録できない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'priceが300未満では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は¥300~¥9,999,999の間にして下さい')
      end
      it 'priceが9,999,999より大きいと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は¥300~¥9,999,999の間にして下さい')
      end
      it 'priceが半角数値以外を含む場合は登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は¥300~¥9,999,999の間にして下さい')
      end
      it 'ユーザーが紐付いていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
