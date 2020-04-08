class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :postal_code, :prefecture_id, :city, :street ,presence: true
end
