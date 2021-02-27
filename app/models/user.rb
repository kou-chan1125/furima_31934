class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーションの記入
  has_many :items
  # has_many :orders   ordersテーブルとアソシエーションを組む際に記述する

  # バリデーションの記入
  with_options presence: true do
    validates :nickname
    validates :email,uniqueness: true
    validates :password,format: { with: /(?=.*?[a-z])(?=.*?\d)[a-z\d]/i }

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
      validates :last_name
      validates :first_name
    end

    with_options presence: true, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/ } do
      validates :last_name_kana
      validates :first_name_kana
    end
      validates :birth_day
  end
end
