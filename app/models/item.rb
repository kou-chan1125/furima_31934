class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  #アソシエーションの記入
  belongs_to :category
  belongs_to :condition
  belongs_to :deli_fee
  belongs_to :area
  belongs_to :deli_day

  belongs_to :user

  #activ storage 画像ファイルの紐付け
  has_one_attached :image

  #バリデーションの記入
  with_options presence: true do
    validates :price_name
    validates :description


    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :deli_fee_id
      validates :area_id
      validates :deli_day_id

    end
     validates :price
  end
end
