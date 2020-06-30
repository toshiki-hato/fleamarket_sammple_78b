# README

# DB設計
## Userテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|phonetic|string|null: false|
|birthday|string|null: false|
|nickname|string|null: false|
|email|string|null: false,uniqueness: true |
|password|string|null: false|
|encrypted_password|string|null: false|
|send_name|string|null: false|
|send_name_phonetic|string|null: false|
|postal_code|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|address|string|null: false|
|condominium_name|string||
|phone number|string||

### Association
- has_many :products
- has_one :card


## Cardテーブル
|Column|Type|Options|
|------|----|-------|
|number|string|null: false|
|name|string|null: false|
|good_thru|string|null: false|
|security_code|string|null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user


## Productテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|price|string|null: false|
|status|string|null: false|
|shipping_expenses|string|null: false|
|send_from|string|null: false|
|lead_time|string|null: false|

### Association
- has_many :product_images
- has_many :product_categories
- has_many :category, through: :product_categories
- belongs_to :user


## Product＿Categoryテーブル
|Column|Type|Options|
|------|----|-------|
|product|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|

### Association
- belongs_to :product
- belongs_to :category


## Categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :product_categories
- has_many :products, through: :product_categories