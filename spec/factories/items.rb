FactoryBot.define do
  factory :item do
    prise_name              { 'テスト' }
    description             { '商品の紹介です' }
    category_id             {'2'}
    condition_id            {'2'}
    deli_fee_id             {'2'}
    area_id                 {'2'}
    deli_day_id             {'2'}
    price                   {'11111'}
    # image                   fixture_file_upload('app/assets/images/flag.png')
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'flag.png', content_type: 'image/png')
    end
  end
end
