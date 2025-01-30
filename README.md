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
| Column          | Type    | Options                   |
|---------------|--------|--------------------------|
| nickname      | string | null: false              |
| email         | string | null: false, unique: true |
| password      | string | null: false              |
| full_name     | string | null: false              |
| full_name_kana| string | null: false              |
| birth_date    | date   | null: false              |

### Associations
- has_many :products
- has_many :purchases

## Products Table
| Column         | Type    | Options                   |
|--------------|--------|--------------------------|
| image        | string | null: false              |
| name         | string | null: false              |
| description  | text   | null: false              |
| category     | string | null: false              |
| condition    | string | null: false              |
| shipping_fee | string | null: false              |
| location     | string | null: false              |
| shipping_days| string | null: false              |
| price        | integer| null: false              |
| user_id      | references | foreign_key: true |

### Associations
- belongs_to :user
- has_one :purchase

## Purchases Table
| Column   | Type       | Options                   |
|---------|-----------|--------------------------|
| user_id | references | null: false, foreign_key: true |
| product_id | references | null: false, foreign_key: true |

### Associations
- belongs_to :user
- belongs_to :product
- has_one :shipping_info

## Shipping Information Table
| Column     | Type       | Options                   |
|-----------|-----------|--------------------------|
| address   | string    | null: false              |
| phone     | string    | null: false              |
| purchase_id | references | null: false, foreign_key: true |

### Associations
- belongs_to :purchase