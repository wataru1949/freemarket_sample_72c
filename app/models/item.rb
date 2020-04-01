class Item < ApplicationRecord
  has_many :item_images
  belongs_to :category
  belongs_to :brand
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :shipping_date
  belongs_to :shipping_method
  belongs_to :user
end
