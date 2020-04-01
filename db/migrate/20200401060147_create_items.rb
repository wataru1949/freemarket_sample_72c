class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :name,               null:false
      t.text       :detail,             null:false
      t.integer    :price,              null:false
      t.integer    :state,              null:false,default: 0
      t.integer :category_id,        null:false, foreign_key: true #referencesをintegerに変更中
      t.integer :brand_id,           foreign_key: true             #referencesをintegerに変更中
      t.integer :condition_id,       null:false, foreign_key: true #referencesをintegerに変更中
      t.integer :shipping_cost_id,   null:false, foreign_key: true #referencesをintegerに変更中
      t.integer :shipping_date_id,   null:false, foreign_key: true #referencesをintegerに変更中
      t.integer :shipping_method_id, null:false, foreign_key: true #referencesをintegerに変更中
      t.integer :seller_id,          null:false, foreign_key: true #referencesをintegerに変更中
      t.integer :buyer_id,           null:false, foreign_key: true #referencesをintegerに変更中
      t.timestamps
    end
  end
end
