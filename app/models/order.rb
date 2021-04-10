class Order < ApplicationRecord
  # アソシエーションの記入
  belongs_to :user
  belongs_to :item
  has_one :address
end
