class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  validates :name,                   presence: true
  validates :info,                   presence: true
  validates :category_id,            numericality: { other_than: 1, message: "can't be blank" }
  validates :sales_status_id,        numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,          numericality: { other_than: 1, message: "can't be blank" }
  validates :scheduled_delivery_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :price,                  presence: true,
                                     numericality: { less_than_or_equal_to: 9_999_999, greater_than_or_equal_to: 300, message: 'は¥300~¥9,999,999の間にして下さい' }
  validates :image,                  presence: true
end
