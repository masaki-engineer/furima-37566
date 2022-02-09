FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    last_name             { '真崎' }
    first_name            { '彰大' }
    last_name_kana        { 'マサキ' }
    first_name_kana       { 'アキヒロ' }
    birth_date            { Faker::Date.backward }
  end
end
