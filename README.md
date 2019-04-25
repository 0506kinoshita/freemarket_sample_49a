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
-has_one :address
-has_one :creditcard

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
<!-- homephoneに変更しました -->
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
<!-- order tableからAssociation -->
## like_middleテーブル
|Column|Type|Options|
|------|----|-------|
|send_user|integer|not null|
|received_user|integer|not null|
<!-- order tableからAssociation -->
## like_lowテーブル
|Column|Type|Options|
|------|----|-------|
|send_user|integer|not null|
|received_user|integer|not null|
<!-- order tableからAssociation -->
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
|detail|text|
|condition|string|not null|
|delivery_fee|integer|not null|
|region|string|not null|
|day_rule|string|not null|
|price|integer|not null|
|user_id|integer|foreign_key :true|
|size|string|
|image|text|not null|

### Association
-has_one :delivery
-has_many :genres
-has_many :brands
-has_many :categories

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|body|text|not null|
|user_id|integer|not null|
|send_user_id|integer|not null|
|item_id|integer|foreign_key :true|

### Association
-has_one :items
-has_one :order

## order_itemテーブル
Column|Type|Options|
|------|----|-------|
|item_id|integer|foreign_key :true|
|buyer_id|integer|foreing_key :true|
|user_id|integer|foreign_key :true|

## sold_itemテーブル
Column|Type|Options|
|------|----|-------|
|item_id|integer|foreign_key :true|
|buyer_id|integer|foreing_key :true|
|user_id|integer|foreign_key :true|

## brnadsテーブル
Column|Type|Options|
|------|----|-------|
|name|string|not null, unique|

## categoriesテーブル
Column|Type|Options|
|------|----|-------|
|name|string|not null|

## item_categoriesテーブル
Column|Type|Options|
|------|----|-------|
|item_id|integer|foreign_key :ture|
|category_id|integer||foreign_key :true|
