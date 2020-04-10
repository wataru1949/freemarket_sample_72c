class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :name,               null: false
      t.text       :detail,             null: false
      t.integer    :price,              null: false
      t.integer    :state,              null: false, default: "0"
      # t.references :category,           foreign_key: true
      t.string     :brand
      t.integer    :condition_id,       null: false
      t.integer    :shipping_cost_id,   null: false
      t.integer    :shipping_date_id,   null: false
      t.integer    :shipping_method_id, null: false
      t.integer    :prefecture_id,      null: false
      t.integer    :user_id,            null: false
      # t.integer    :buyer_id,           null: false
      t.timestamps
    end
  end
end