class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :prefecture_id, :city, :street ,presence: true
  
  belongs_to :user, optional: true
  belongs_to_active_hash :prefecture
end
