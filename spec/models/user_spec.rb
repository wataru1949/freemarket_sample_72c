require 'rails_helper'

describe User do
  describe '#create' do

    it 'ユーザーが有効であること' do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end

    it 'ニックネームなしで登録ができないこと' do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it '苗字（漢字）なしで登録ができないこと' do
      user = build(:user, lastname: "")
      user.valid?
      expect(user.errors[:lastname]).to include("を入力してください")
    end

    it '名前（漢字）なしで登録ができないこと' do
      user = build(:user, firstname: "")
      user.valid?
      expect(user.errors[:firstname]).to include("を入力してください")
    end

    it '苗字（カナ）なしで登録ができないこと' do
      user = build(:user, lastname_kana: "")
      user.valid?
      expect(user.errors[:lastname_kana]).to include("を入力してください")
    end

    it '名前（カナ）なしで登録ができないこと' do
      user = build(:user, firstname_kana: "")
      user.valid?
      expect(user.errors[:firstname_kana]).to include("を入力してください")
    end

    it '生年月日なしで登録ができないこと' do
      user = build(:user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end

    it 'メールアドレスなしで登録ができないこと' do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it 'パスワードなしで登録ができないこと' do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it 'パスワードと確認用パスワードが一致しないとき登録ができないこと' do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it '重複するメールアドレスが存在するとき登録ができないこと' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "パスワードが7文字以上のとき登録ができること" do
      user = build(:user, password: "1234567", password_confirmation: "1234567")
      user.valid?
      expect(user).to be_valid
    end

    it 'パスワードが7文字未満のとき登録ができないこと' do
      user = build(:user, password: "123456", password_confirmation: "123456")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it '苗字は全角であれば登録ができること' do
      user = build(:user, lastname: "山田")
      user.valid?
      expect(user).to be_valid
    end

    it '名前は全角であれば登録ができること' do
      user = build(:user, firstname: "太郎")
      user.valid?
      expect(user).to be_valid
    end

    it '苗字(カナ)は全角カナでないと登録ができないこと' do
      user = build(:user, lastname_kana: "ヤマダ")
      user.valid?
      expect(user).to be_valid
    end

    it '苗字(カナ)は全角カナでないと登録ができないこと' do
      user = build(:user, firstname_kana: "タロウ")
      user.valid?
      expect(user).to be_valid
    end

  end
end
