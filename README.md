# README

# DB設計

## ER図
![image](https://user-images.githubusercontent.com/61734650/79534565-de958c00-80b5-11ea-966f-e175661c6bf3.png)

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|
### Association
has_one :address
has_one :card
has_many :items
</br>

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|detail|text|null: false|
|price|integer|null: false|
|state|integer|null: false, default: 0|
|category_id|reference|null: false, foreign_key: true|
|brand|string||
|condition_id|integer|null: false|
|shipping_cost_id|integer|null: false|
|shipping_date_id|integer|null: false|
|shipping_method_id|integer|null: false|
|prefecture_id|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|buyer|integer||
### Association
belongs_to :user
belongs_to :category
has_many :item_images
</br>

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|street|string|null: false|
|building|string||
|phone|string||
|user_id|reference|null: false, foreign_key: true|
### Association
has_one :user
</br>

## cardテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
has_one :user
</br>

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
### Association
has_many :items
</br>

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association
belong_to :item