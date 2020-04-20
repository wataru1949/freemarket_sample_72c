require 'rails_helper'

describe Card do
  describe '#create' do

    it "顧客IDなしで登録できないこと" do
    card = build(:card, customer_id: nil)
    card.valid?
    expect(card.errors[:customer_id]).to include("を入力してください")
    # エラー文が日本語表記になっている。デフォルトは英語で『can’t be blank』
    end

    it "ユーザーIDなしで登録できないこと" do
    card = build(:card, user_id: nil)
    card.valid?
    expect(card.errors[:user_id]).to include("を入力してください")
    end

    it "カードIDなしで登録できないこと" do
    card = build(:card, card_id: nil)
    card.valid?
    expect(card.errors[:card_id]).to include("を入力してください")
    end

  end
end