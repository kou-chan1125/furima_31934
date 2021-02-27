FactoryBot.define do

  factory :user do
    nickname              { 'テスト' }
    email                 { Faker::Internet.email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    first_name            { 'ぜんかく' }
    last_name             { 'ぜんかく' }
    first_name_kana            { 'ゼンカクカナ' }
    last_name_kana             { 'ゼンカクカナ' }
    birth_day { '2020-01-01' }
  end
end
