FactoryBot.define do
  password = Faker::Internet.password(min_length: 6, max_length: 100)

  factory :user do
    nickname              { 'テスト' }
    email                 { Faker::Internet.email }
    password              { password }
    password_confirmation { password }
    first_name            { 'ぜんかく' }
    last_name             { 'ぜんかく' }
    first_name_kana            { 'ゼンカクカナ' }
    last_name_kana             { 'ゼンカクカナ' }
    birth_day { '2020-01-01' }
  end
end
