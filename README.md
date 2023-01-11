# README

## users テーブル

| Column             | Type   | Option                   |
| -----------------  |--------|--------------------------|
| email              | string | null: false unique: true |
| encrypted_password | string | null: false              |
| nickname           | string | null: false              |
| first_name         | string | null: false              |
| last_name          | string | null: false              |
| first_name_kana    | string | null: false              |
| last_name_kana     | string | null: false              |
| birthday           | date | null: false                |

Association
·has_many :items
·has_many :orders


## items テーブル

| Column             | Type   | Option                   |
| -----------------  |--------|--------------------------|
| name               | string | null: false              |
| description          | text   | null: false              |
| price              | integer| null: false              |
| category_id        | integer| null: false              |
| item_condition_id  | integer| null: false              |
| delivery_charge_id | integer|  null: false             |
| prefecture_id       | integer|  null: false             |
| shipping_day_id    | integer|  null: false             |
| user               |references|	null: false, foreign_key: true|

Association
·belongs_to :user
·has_one :order
·has_many :comment

## orders テーブル

| Column             | Type   | Option                   |
| -----------------  |--------|--------------------------|
| user               |references|	null: false, foreign_key: true|
| item               |references|	null: false, foreign_key: true|

Association
·belongs_to :user
·belongs_to :item
·has_one :payment


## payments テーブル

| Column             | Type   | Option                   |
| -----------------  |--------|--------------------------|
| post_code          | string | null: false              |
| prefecture_id      | integer| null: false              |
| city               | string | null: false              |
| block              | string | null: false              |
| building           | string |                          |
| phone_number       | string | null: false              |
| order              |references|	null: false, foreign_key: true|

Association
·belongs_to :order
 
## comments テーブル
| Column             | Type   | Option                                 |
| -----------------  |-------     -|-----------------------------------|
| user               | references  | null: false, foreign_key: true    |
| item               | references  | null: false, foreign_key: true    |
| comment            | text        | null: false                       |

Association
·belongs_to :user
·belongs_to :item
