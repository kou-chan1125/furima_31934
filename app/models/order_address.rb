class OrderAddress
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :house_num, :building_name, :tel_num, :token

  # バリデーションの記入
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipality, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' }
    validates :house_num
    validates :tel_num, format: { with: /\A\d{10,11}\z/ }
    validates :token
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, house_num: house_num,
                   building_name: building_name, tel_num: tel_num, order_id: order.id)
  end
end
