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

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|not null, unique|
|mail-address|text|not null, unique|
|password|string|not null|
|password_confirm|string|not null|
|last_name|string|not null|
|first_name|string|not null|
|last_name_kana|string|not null|
|first_name_kana|string|not null|
|birth_year|integer|not null|
|birth_month|integer|not null|
|birth_day|integer|not null|
|phone_number|integer|not null, unique|

### Association
-has_one :address dependent: :destroy
-has_one :creditcard dependent: :destroy
-has_many :notices dependent: :destroy
-has_many :items dependent: :destroy
-has_many :like_high dependent: :destroy
-has_many :like_middle dependent: :destroy
-has_many :like_low dependent: :destroy

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|zip-code|integer|not null|
|prefecture|string|not null|
|city|string|not null|
|block_number|text|not null|
|building_name|text|
|homephone_number|integer|
|user_id|integer|foreign_key :true|
### Association
-has_one :user

## creditcardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|not null, unique|
|expiration_month|integer|not null|
|expiration_year|integer|not null|
|securith_code|integer|not null|
|user_id|integer|foreign_key :true|

### Association
-has_one :user

## like_highテーブル
|Column|Type|Options|
|------|----|-------|
|send_user|integer|not null|
|received_user|integer|not null|

### Association
belongs_to :user

## like_middleテーブル
|Column|Type|Options|
|------|----|-------|
|send_user|integer|not null|
|received_user|integer|not null|

### Association
belongs_to :user

## like_lowテーブル
|Column|Type|Options|
|------|----|-------|
|send_user|integer|not null|
|received_user|integer|not null|

### Association
belongs_to :user

## noticesテーブル
Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key :true|
|title|text|not null|
|body|text|not null|

### Association
-belongs_to :user

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|
|user_id|integer|foreign_key :true|

### Association
-belongs_to :user
-belongs_to :item

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|not null|
|size|string|
|condition|string|not null|
|shipment_day|string|not null|
|delivery_fee|string|not null|
|price|integer|not null|
|detail|text|not null|
|prefecture|string|not null|
|user_id|integer|foreign_key :true|
|image|text|not null|

### Association
-has_many :items_likes dependent: :destroy
-has_many :comments dependent: :destroy
-belongs_to :brand
-has_many :item_categories
-has_many :categories through item_categories
-has_many :ordered_items
-belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|body|text|not null|
|user_id|integer|not null|
|send_user_id|integer|not null|
|item_id|integer|foreign_key :true|

### Association
-belongs_to :item

## ordered_itemsテーブル
Column|Type|Options|
|------|----|-------|
|item_id|integer|foreign_key :true|
|buyer_id|integer|foreing_key :true|
|user_id|integer|foreign_key :true|

### Association
-belongs_to :item dependent: :destroy
-has_many :sold_items
## sold_itemsテーブル
Column|Type|Options|
|------|----|-------|ß
|item_id|integer|foreign_key :true|
|buyer_id|integer|foreing_key :true|
|user_id|integer|foreign_key :true|

### Association
belongs_to :ordered_item

## brnadsテーブル
Column|Type|Options|
|------|----|-------|
|name|string|not null, unique|

### Association
-has_many :items

## categoriesテーブル
Column|Type|Options|
|------|----|-------|
|name|string|not null|
|item_category_id|integer|not null|

### Association
-has_many :item through item_categories

## item_categoriesテーブル
Column|Type|Options|
|------|----|-------|
|item_id|integer|foreign_key :ture|
|category_id|integer||foreign_key :true|

### Association
belongs_to :item
belongs_to :category