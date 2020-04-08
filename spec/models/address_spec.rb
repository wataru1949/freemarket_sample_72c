require 'rails_helper'

describe Address do
  describe '#create' do

    it 'アドレスが有効であること' do
      user    = build(:user)
      address = build(:address, user_id: user.id)
      address.valid?
      expect(address).to be_valid
    end

    it '郵便番号なしで登録ができないこと' do
      user    = build(:user)
      address = build(:address, user_id: user.id, postal_code: "")
      address.valid?
      expect(address.errors[:postal_code]).to include("を入力してください")
    end

    it '都道府県なしで登録ができないこと' do
      user    = build(:user)
      address = build(:address, user_id: user.id, prefecture_id: nil)
      address.valid?
      expect(address.errors[:prefecture_id]).to include("を入力してください")
    end

    it '市区町村なしで登録ができないこと' do
      user    = build(:user)
      address = build(:address, user_id: user.id, city: "")
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    it '番地なしで登録ができないこと' do
      user    = build(:user)
      address = build(:address, user_id: user.id, street: "")
      address.valid?
      expect(address.errors[:street]).to include("を入力してください")
    end

    it 'マンション名・ビル名・部屋番号なしでも登録ができること' do
      user    = build(:user)
      address = build(:address, user_id: user.id, building: "")
      address.valid?
      expect(address).to be_valid
    end

    it '電話番号なしでも登録ができること' do
      user    = build(:user)
      address = build(:address, user_id: user.id, phone: "")
      address.valid?
      expect(address).to be_valid
    end

  end
end
