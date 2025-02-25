# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Users Table
| Column            | Type    | Options                    |
|------------------|--------|--------------------------|
| nickname        | string | null: false              |
| email           | string | null: false, unique: true |
| encrypted_password | string | null: false              |
| last_name       | string | null: false              |
| first_name      | string | null: false              |
| last_name_kana  | string | null: false              |
| first_name_kana | string | null: false              |
| birth_date      | date   | null: false              |


### Associations
- has_many :items
- has_many :purchases

## items Table
| Column          | Type       | Options                        |
|----------------|-----------|--------------------------------|
| name          | string     | null: false                   |
| description   | text       | null: false                   |
| category_id   | integer    | null: false                   |
| condition_id  | integer    | null: false                   |
| shipping_fee_id | integer  | null: false                   |
| location_id   | integer    | null: false                   |
| shipping_day_id | integer | null: false                   |
| price         | integer    | null: false                   |
| user       | references | null: false, foreign_key: true |


### Associations
- belongs_to :user
- has_one :orders

## Orders Table
| Column    | Type       | Options                        |
|----------|-----------|--------------------------------|
| user     | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

### Associations
- belongs_to :user
- belongs_to :item
- has_one :address

## address Table
| Column         | Type       | Options                        |
|---------------|-----------|--------------------------------|
| postal_code   | string     | null: false                   |
| location_id   | integer    | null: false                   |
| city          | string     | null: false                   |
| address       | string     | null: false                   |
| building      | string     |                                |
| phone         | string     | null: false                   |
| purchase      | references | null: false, foreign_key: true |

### Associations
- belongs_to :orders