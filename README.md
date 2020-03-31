# README

# DB設計

## ER図
![image](https://user-images.githubusercontent.com/53987306/77992980-21d7c700-7362-11ea-8257-782e6803a381.png)

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false,unique: true|
|password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|
### Association
has_one :addresses
has_one :credit
has_many :items

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|
|city|string||
|street|string||
|building|string||
|phone|string|null: false|
|user_id|reference|null: false, foreign_key: true|
|prefecture_id|reference|null: false, foreign_key: true|
### Association
belongs_to :users
belongs_to :prefecture

## prefecturesテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
### Association
has_many :address

## creditsテーブル
|Column|Type|Options|
|------|----|-------|
|number|string|null: false|
|month|date|null: false|
|year|date|null: false|
|code|integer|null: false|
|user_id|reference|null: false, foreign_key: true|
### Association
belongs_to :users

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|detail|text|null: false|
|price|integer|null: false|
|state|integer|null: false, default: 0|
|category_id|reference|null: false, foreign_key: true|
|bland_id|reference|foreign_key: true|
|condition_id|reference|null: false, foreign_key: true|
|shipping_cost_id|reference|null: false, foreign_key: true|
|shipping_date_id|reference|null: false, foreign_key: true|
|shipping_method_id|reference|null: false,foreign_key: true|
|seller_id|reference|null: false, foreign_key: true|
|buyer_id|reference|null: false, foreign_key: true|
### Association
belongs_to :item_images
belongs_to :categories
belongs_to :brands
belongs_to :conditions
belongs_to :shipping_costs
belongs_to :shipping_dates
belongs_to :shipping_methods
belongs_to :users

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|reference|null: false,foreign_key: true|
### Association
belong_to :items

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
### Association
has_many :items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|
### Association
has_many :items

## conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|select|string|null: false|
### Association
has_many :items

## shipping_costsテーブル
|Column|Type|Options|
|------|----|-------|
|select|string|null: false|
### Association
has_many :items

## shipping_datesテーブル
|Column|Type|Options|
|------|----|-------|
|select|string|null: false|
### Association
has_many :items

## shipping_methodsテーブル
|Column|Type|Options|
|------|----|-------|
|select|string|null: false|
### Association
has_many :items
