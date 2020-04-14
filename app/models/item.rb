class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :name, :detail, :price, :state, :condition, :shipping_cost, :shipping_date, :shipping_method, :item_images, presence: true
  validates :name, length: { maximum: 40 }
  validates :detail, length: { maximum: 1000 }
  validates :price, numericality: { greater_than_or_equal_to: 300 }
  validates :price, numericality: { less_than_or_equal_to: 9999999 }
  validates :state, numericality: { greater_than_or_equal_to: 0 }
  validates :state, numericality: { less_than_or_equal_to: 3 }

  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipping_method
  belongs_to_active_hash :shipping_date
  
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  belongs_to :user
  belongs_to :category
end
