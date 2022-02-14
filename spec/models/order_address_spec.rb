require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1 # インス変数生成時に負荷が増加しエラーが起きるため一時停止
  end

  describe '商品購入' do
    context '購入できるとき' do
      it '全項目が存在すれば購入できる' do
        expect(@order_address).to be_valid
      end
      it '建物名がなくても購入できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end
    context '購入できないとき' do
      it 'トークンが空では投稿できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空では投稿できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が全角では投稿できない' do
        @order_address.postal_code = '１２３ー４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code は半角数字3桁-(ハイフン)半角数字4桁で入力して下さい')
      end
      it '郵便番号がハイフンを含まないと投稿できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code は半角数字3桁-(ハイフン)半角数字4桁で入力して下さい')
      end
      it '郵便番号がの桁数が間違っていると投稿できない' do
        @order_address.postal_code = '1234-567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code は半角数字3桁-(ハイフン)半角数字4桁で入力して下さい')
      end
      it '都道府県が選択されていないと投稿できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空では投稿できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では投稿できない' do
        @order_address.addresses = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Addresses can't be blank")
      end
      it '電話番号が空では投稿できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が全角では投稿できない' do
        @order_address.phone_number = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number は半角数字10桁もしくは半角数字11桁(ハイフンなし)で入力して下さい')
      end
      it '電話番号がハイフンを含むと投稿できない' do
        @order_address.phone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number は半角数字10桁もしくは半角数字11桁(ハイフンなし)で入力して下さい')
      end
      it '電話番号が10桁より少ないと投稿できない' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number は半角数字10桁もしくは半角数字11桁(ハイフンなし)で入力して下さい')
      end
      it '電話番号が11桁より多いと投稿できない' do
        @order_address.phone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number は半角数字10桁もしくは半角数字11桁(ハイフンなし)で入力して下さい')
      end
      it 'ユーザーが紐付いていなければ登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it '商品が紐付いていなければ登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
