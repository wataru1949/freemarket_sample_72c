# README

# DB設計

## ER図
![image](https://user-images.githubusercontent.com/53987306/78009231-abe05980-737b-11ea-8d23-a8f3262d5570.png)

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
has_one :address  
has_one :credit  
has_many :items  
</br>

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string||
|prefecture_id|string||
|city|string||
|street|string||
|building|string||
|phone|string|null: false|
|user_id|reference|null: false, foreign_key: true|
### Association
belongs_to :user  
</br>

## creditsテーブル
|Column|Type|Options|
|------|----|-------|
|number|string|null: false|
|month|date|null: false|
|year|date|null: false|
|code|integer|null: false|
|user_id|reference|null: false, foreign_key: true|
### Association
belongs_to :user  
</br>

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|detail|text|null: false|
|price|integer|null: false|
|state|integer|null: false, default: 0|
|category_id|reference|null: false, foreign_key: true|
|brand_id|reference|foreign_key: true|
|condition_id|reference|null: false, foreign_key: true|
|shipping_cost_id|reference|null: false, foreign_key: true|
|shipping_date_id|reference|null: false, foreign_key: true|
|shipping_method_id|reference|null: false,foreign_key: true|
|seller_id|reference|null: false, foreign_key: true|
|buyer_id|reference|null: false, foreign_key: true|
### Association
has_many :item_images  
belongs_to :category  
belongs_to :brand  
belongs_to :condition  
belongs_to :shipping_cost  
belongs_to :shipping_date  
belongs_to :shipping_method  
belongs_to :user  
</br>

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|reference|null: false,foreign_key: true|
### Association
belong_to :item  
</br>

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
### Association
has_many :items  
</br>

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|
### Association
has_many :items  
</br>

## conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|select|string|null: false|
### Association
has_many :items  
</br>

## shipping_costsテーブル
|Column|Type|Options|
|------|----|-------|
|select|string|null: false|
### Association
has_many :items  
</br>

## shipping_datesテーブル
|Column|Type|Options|
|------|----|-------|
|select|string|null: false|
### Association
has_many :items  
</br>

## shipping_methodsテーブル
|Column|Type|Options|
|------|----|-------|
|select|string|null: false|
### Association
has_many :items  
