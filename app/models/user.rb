class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーションの記入
  has_many :items
  has_many :orders

  # バリデーションの記入
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, format: { with: /(?=.*?[a-z])(?=.*?\d)[a-z\d]/i }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/ } do
    validates :last_name_kana
    validates :first_name_kana
  end
  validates :birth_day, presence: true
end
