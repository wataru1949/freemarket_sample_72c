class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string    :name,            null: false
      t.text      :detail,          null: false
      t.integer   :price,           null: false
      t.integer   :state,           null: false, default: "0"
      # t.reference :category_id,     null: false, foreign_key: true
      t.string    :brand
      t.string    :condition,       null: false
      t.string    :shipping_cost,   null: false
      t.string    :shipping_id,     null: false
      t.string    :shipping_method, null: false
      # t.reference :seller_id,       null: false, foreign_key: true
      # t.reference :buyer_id,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
