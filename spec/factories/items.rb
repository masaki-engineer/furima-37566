FactoryBot.define do
  factory :item do
    name                   { Faker::Lorem.sentence }
    info                   { Faker::Lorem.sentence }
    category_id            { Random.rand(2..11) }
    sales_status_id        { Random.rand(2..7) }
    shipping_fee_status_id { Random.rand(2..3) }
    prefecture_id          { Random.rand(2..48) }
    scheduled_delivery_id  { Random.rand(2..4) }
    price                  { Random.rand(300..9999999) }
    association :user
  end
end
