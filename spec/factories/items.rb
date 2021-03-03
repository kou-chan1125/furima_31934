FactoryBot.define do
  factory :item do
    prise_name              { 'テスト' }
    description             { '商品の紹介です' }
    category_id             {'1'}
    condition_id            {'1'}
    deli_fee_id             {'1'}
    area_id                 {'1'}
    deli_day_id             {'1'}
    price                   {}

  end
end
