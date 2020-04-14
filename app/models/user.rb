class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :lastname, :firstname, :lastname_kana, :firstname_kana, :birthday, presence: true

  validates :lastname, :firstname,
            format: {
              with: /\A[ぁ-んァ-ン一-龥]/,
              message: "は全角のみで入力して下さい"
            }
  validates :lastname_kana, :firstname_kana,
            format: {
              with: /\A[ァ-ヶー－]+\z/,
              message: "は全角カタカナのみで入力して下さい"
            }

  has_one :address
  has_many :items, dependent: :destroy
end
