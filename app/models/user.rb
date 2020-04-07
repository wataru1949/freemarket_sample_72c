class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :lastname, :firstname, :lastname_kana, :firstname_kana, :birthday,presence: true
  validates :encrypted_password, length: { minimum: 7 }
  has_one :address
end
