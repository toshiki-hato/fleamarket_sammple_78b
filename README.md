# README

# DB設計
## Userテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|phonetic|string|null: false|
|birthday|date|null: false|
|nickname|string|null: false|
|email|string|null: false,uniqueness: true|
|password|string|null: false|
|encrypted_password|string|null: false|
|send_name|string|null: false|
|send_name_phonetic|string|null: false|
|condominium_name|string||
|phone number|string||

### Association
- has_many :products
- has_one :street_address
- has_one :card


## Street_addressテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|address|string|null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user


## Cardテーブル
|Column|Type|Options|
|------|----|-------|
|number|string|null: false|
|name|string|null: false|
|good_thru|date|null: false|
|security_code|string|null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user


## Productテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|price|integer|null: false|
|status|string|null: false|
|shipping_expenses|string|null: false|
|send_from|string|null: false|
|lead_time|string|null: false|
|order|string||
|buyer_id|integer||
|user|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|

### Association
- has_many :product_images
- belongs_to :user
- belongs_to :category


## Product_imageテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product|references|null: false, foreign_key: true|

### Association
- belongs_to :product


## Categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products

# ハローワールド