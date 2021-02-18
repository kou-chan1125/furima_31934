# テーブル設計


## usersテーブル

| Column              | Type   | Options                         |
| ------------------- | ------ | ------------------------------- |
| nickname            | string | null: false                     |
| email               | string | null: false,unique: true	       |
| encrypted_password  | string | null: false                     |
| last_name           | string | null: false                     |
| first_name          | string | null: false                     |
| last_name_kana      | string | null: false                     |
| first_name_kana     | string | null: false                     |
| birth_day           | date   | null: false                     |


### Association
has_many :items
has_many :orders



## itemsテーブル

| Column            | Type        | Options                         |
| ----------------- | ----------- | ------------------------------- |
| prise_name        | string      | null: false                     |
| description       | text        | null: false                     |
| category_id       | integer     | null: false                     |
| condition_id      | integer     | null: false                     |
| deli_fee_id       | integer     | null: false                     |
| area_id           | integer     | null: false                     |
| deli_day_id       | integer     | null: false                     |
| price             | integer     | null: false                     |
| user              | references  | null: false, foreign_key: true  |

### Association
belongs_to :user
has_one :order

## ordersテーブル

| Column   | Type       | Options                       |
| -------- | ---------- | ----------------------------- |
| user     | references | null: false,foreign_key: true |
| item     | references | null: false,foreign_key: true |

### Association
 belongs_to :user
 belongs_to :item
 has_one :address



 ## addressesテーブル

| Column            | Type        | Options                         |
| ----------------- | ----------- | ------------------------------- |
| postal_code       | string      | null: false                     |
| prefecture_id     | integer     | null: false                     |
| municipality      | string      | null: false                     |
| house_num         | string      | null: false                     |
| building_name     | string      |                                 |
| tel_num           | string      | null: false                     |
| order             | references  | null: false,foreign_key: true   |


### Association
belongs_to :order
