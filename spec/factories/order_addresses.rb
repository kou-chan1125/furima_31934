FactoryBot.define do
  factory :order_address do
    postal_code             { '111-1111' }
    prefecture_id           { 1 }
    municipality            { 'テスト' }
    house_num               { 'テスト' }
    tel_num                 { '01234567890' }
    token                   { 'tok_abcdefghijk00000000000000000' }

    user_id                 { 1 }
    item_id                 { 1 }
  end
end
