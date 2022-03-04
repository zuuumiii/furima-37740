# テーブル設計

## usersテーブル

| Colummn            | Type    | Option                   |
|--------------------|---------|--------------------------|
| email              | stirng  | null:false, unique:true  |
| encrypted_password | string  | null:false               |
| nickname           | stirng  | null:false               |
| first_name         | stirng  | null:false               |
| last_name          | stirng  | null:false               |
| first_name_kana    | stirng  | null:false               |
| last_name_kana     | stirng  | null:false               |
| birth_date         | date    | null:false               |

## Association
has_many :items
has_many :orders

## itemsテーブル

| Colummn       | Type       | Option                        |
|---------------|------------|-------------------------------|
| name          | stirng     | null:false                    |
| info          | text       | null:false                    |
| category_id   | integer    | null:false                    |
| status_id     | integer    | null:false                    |
| shipping_id   | integer    | null:false                    |
| prefecture_id | integer    | null:false                    |
| schedule_id   | integer    | null:false                    |
| price         | integer    | null:false                    |
| sold          | boolean    | null:false, default: false    |
| user          | references | null:false, foregin_key: true |

## Association
belongs_to :user
has_one :order


## ordersテーブル

| Colummn       | Type       | Option                        |
|---------------|------------|-------------------------------|
| item          | references | null:false, foregin_key: true |
| user          | references | null:false, foregin_key: true |

## Association
belongs_to :user
has_one :address

## addressesテーブル

| Colummn       | Type       | Option                        |
|---------------|------------|-------------------------------|
| postal_cod    | stirng     | null:false                    |
| prefecture_id | integer    | null:false                    |
| city          | integer    | null:false                    |
| address       | integer    | null:false                    |
| building      | integer    |                               |
| phone         | integer    | null:false                    |
| order         | references | null:false, foregin_key: true |

## Association
belongs_to :order
