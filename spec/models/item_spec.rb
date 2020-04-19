require 'rails_helper'

describe Item do
  describe '#create' do
    
    it 'アイテムが有効であること' do
      item = build(:item)
      expect(item).to be_valid
    end
    
    it '商品画像なしで登録ができないこと' do
      item = build(:item)
      item.item_images = []
      item.valid?
      expect(item.errors[:item_images]).to include("を入力してください")
    end
    
    it '商品名なしで登録ができないこと' do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it '商品の説明なしで登録ができないこと' do
      item = build(:item, detail: "")
      item.valid?
      expect(item.errors[:detail]).to include("を入力してください")
    end

    it 'カテゴリーなしで登録ができないこと' do
      item = build(:item, category: nil)
      item.valid?
      expect(item.errors[:category]).to include("を入力してください")
    end

    it '商品の状態なしで登録ができないこと' do
      item = build(:item, condition: nil)
      item.valid?
      expect(item.errors[:condition]).to include("を入力してください")
    end

    it '配送料の負担なしで登録ができないこと' do
      item = build(:item, shipping_cost: nil)
      item.valid?
      expect(item.errors[:shipping_cost]).to include("を入力してください")
    end

    it '配送の方法なしで登録ができないこと' do
      item = build(:item, shipping_method: nil)
      item.valid?
      expect(item.errors[:shipping_method]).to include("を入力してください")
    end

    it '発送元の地域なしで登録ができないこと' do
      item = build(:item, prefecture: nil)
      item.valid?
      expect(item.errors[:prefecture]).to include("を入力してください")
    end
    
    it '発送までの日数なしで登録ができないこと' do
      item = build(:item, shipping_date: nil)
      item.valid?
      expect(item.errors[:shipping_date]).to include("を入力してください")
    end
    
    it '販売価格なしで登録ができないこと' do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end
    
    it "商品名が40文字以下のとき登録ができること" do
      item  = build(:item, name: "a" * 40)
      item.valid?
      expect(item).to be_valid
    end

    it '商品名が41文字以上のとき登録ができないこと' do
      item = build(:item, name: "a" * 41)
      item.valid?
      expect(item.errors[:name]).to include("は40文字以内で入力してください")
    end

    it "商品の説明が1000文字以下のとき登録ができること" do
      item  = build(:item, detail: "a" * 1000)
      item.valid?
      expect(item).to be_valid
    end

    it '商品の説明が1001文字以上のとき登録ができないこと' do
      item = build(:item, detail: "a" * 1001)
      item.valid?
      expect(item.errors[:detail]).to include("は1000文字以内で入力してください")
    end

    it "販売価格が9999999以下のとき登録ができること" do
      item = build(:item, price: 9999999)
      item.valid?
      expect(item).to be_valid
    end

    it '販売価格が10000000以上のとき登録ができないこと' do
      item = build(:item, price: 10000000)
      item.valid?
      expect(item.errors[:price]).to include("は9999999以下の値にしてください")
    end
  end
end