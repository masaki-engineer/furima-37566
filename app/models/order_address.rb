class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number

  validates :user_id,       presence: true
  validates :item_id,       presence: true
  validates :postal_code,   presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'は半角数字3桁-(ハイフン)半角数字4桁で入力して下さい' }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city,          presence: true
  validates :addresses,     presence: true
  validates :phone_number,  presence: true, format: { with: /\A\d{10,11}\z/, message: 'は半角数字10桁もしくは半角数字11桁(ハイフンなし)で入力して下さい' }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end
end