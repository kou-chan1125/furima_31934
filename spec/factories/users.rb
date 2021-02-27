FactoryBot.define do
  password = Faker::Internet.password(min_length: 7, max_length: 100)

  factory :user do
    # nickname {Faker::Japanese::Name.name}
    # email {Faker::Internet.free_email}
    # password {Faker::Internet.password(min_length: 6)}
    # password_confirmation {password}
    # last_name {Faker::Japanese::Name.last_name}
    # first_name {Faker::Japanese::Name.first_name}
    # last_name_kana {"カタカナ"}
    # first_name_kana {"カタカナ"}
    # birth_day {"2000/02/02"}

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
