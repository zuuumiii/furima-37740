# テーブル設計

## usersテーブル

| Colummn            | Type    | Option                   |
|--------------------|---------|--------------------------|
| email              | string  | null:false, unique:true  |
| encrypted_password | string  | null:false               |
| nickname           | string  | null:false               |
| first_name         | string  | null:false               |
| last_name          | string  | null:false               |
| first_name_kana    | string  | null:false               |
| last_name_kana     | string  | null:false               |
| birth_date         | date    | null:false               |

## Association
has_many :items
has_many :orders

## itemsテーブル

| Colummn       | Type       | Option                        |
|---------------|------------|-------------------------------|
| name          | string     | null:false                    |
| info          | text       | null:false                    |
| category_id   | integer    | null:false                    |
| status_id     | integer    | null:false                    |
| shipping_id   | integer    | null:false                    |
| prefecture_id | integer    | null:false                    |
| schedule_id   | integer    | null:false                    |
| price         | integer    | null:false                    |
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
belongs_to :item
belongs_to :user
has_one :address

## addressesテーブル

| Colummn       | Type       | Option                        |
|---------------|------------|-------------------------------|
| postal_code   | string     | null:false                    |
| prefecture_id | integer    | null:false                    |
| city          | string     | null:false                    |
| address       | string     | null:false                    |
| building      | string     |                               |
| phone         | string     | null:false                    |
| order         | references | null:false, foregin_key: true |

## Association
belongs_to :order
