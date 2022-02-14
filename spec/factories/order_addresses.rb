FactoryBot.define do
  factory :order_address do
    token         { 'tok_abcdefghijk00000000000000000' }
    postal_code   { '123-4567' }
    prefecture_id { Random.rand(2..48) }
    city          { '福岡市' }
    addresses     { '博多区博多1-1' }
    building      { '博多マンション101' }
    phone_number  { '09012345678' }
  end
end
