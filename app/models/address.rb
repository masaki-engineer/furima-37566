class Address < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :postal_code,   presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'は半角数字3桁-(ハイフン)半角数字4桁で入力して下さい' }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city,          presence: true
  validates :addresses,     presence: true
  validates :phone_number,  presence: true, format: { with: /\A\d{10,11}\z/, message: 'は半角数字10桁もしくは半角数字11桁(ハイフンなし)で入力して下さい' }
end
