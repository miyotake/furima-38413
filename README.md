# README

## users テーブル

| Column             | Type   | Option                   |
| -----------------  |--------|--------------------------|
| email              | string | null: false unique: true |
| encrypted_password | string | null: false max length 6 |
| nickname           | string | null: false              |
| first_name         | string | null: false              |
| last_name          | string | null: false              |
| birthday           | date | null: false                |

Association
·has_many :items
·has_many :orders


## items テーブル

| Column             | Type   | Option                   |
| -----------------  |--------|--------------------------|
| name               | string | null: false              |
| text               | text   | null: false              |
| item_price         | integer| null: false              |
| category_id        | integer| null: false              |
| item_condition_id  | integer| null: false              |
| delivery_charge_id | integer|  null: false             |
| user               |references|	null: false, foreign_key: true|

Association
·belongs_to :user
·has_one :order

##　ordersテーブル

| Column             | Type   | Option                   |
| -----------------  |--------|--------------------------|
| user               |references|	null: false, foreign_key: true|
| item               |references|	null: false, foreign_key: true|

Association
·belongs_to :user
·belongs_to :item
·has_one :address


## addressesテーブル

| Column             | Type   | Option                   |
| -----------------  |--------|--------------------------|
| postal_code        | string | null: false              |
| prefecture_id      | integer| null: false              |
| city               | string | null: false              |
| house_number       | string | null: false              |
| building_name      | string | null: false              |
| phone_number       | string | null: false             |
| order              |references|	null: false, foreign_key: true|

Association
·belongs_to :order