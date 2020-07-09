require 'rails_helper'

describe User do
  describe '#create' do

    # 1. 全項目が存在すれば登録できること
    it "is valid" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    
    # 8. 重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
    
    it "is invalid without an email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without an first_name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "is invalid without an first_name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "is invalid without an last_name" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "is invalid without an first_name_phonetic" do
      user = build(:user, first_name_phonetic: nil)
      user.valid?
      expect(user.errors[:first_name_phonetic]).to include("can't be blank")
    end

    it "is invalid without an last_name_phonetic" do
      user = build(:user, last_name_phonetic: nil)
      user.valid?
      expect(user.errors[:last_name_phonetic]).to include("can't be blank")
    end

    it "is invalid without an birthday" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

    it "is invalid without an password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: nil)
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid without an send_first_name" do
      user = build(:user, send_first_name: nil)
      user.valid?
      expect(user.errors[:send_first_name]).to include("can't be blank")
    end

    it "is invalid without an send_last_name" do
      user = build(:user, send_last_name: nil)
      user.valid?
      expect(user.errors[:send_last_name]).to include("can't be blank")
    end

    it "is invalid without an send_first_name_phonetic" do
      user = build(:user, send_first_name_phonetic: nil)
      user.valid?
      expect(user.errors[:send_first_name_phonetic]).to include("can't be blank")
    end

    it "is invalid without an send_last_name_phonetic" do
      user = build(:user, send_last_name_phonetic: nil)
      user.valid?
      expect(user.errors[:send_last_name_phonetic]).to include("can't be blank")
    end

    it "is invalid without an postal_code" do
      user = build(:user, postal_code: nil)
      user.valid?
      expect(user.errors[:postal_code]).to include("can't be blank")
    end

    it "is invalid without an prefectures" do
      user = build(:user, prefectures: nil)
      user.valid?
      expect(user.errors[:prefectures]).to include("can't be blank")
    end

    it "is invalid without an city" do
      user = build(:user, city: nil)
      user.valid?
      expect(user.errors[:city]).to include("can't be blank")
    end

    it "is invalid without an address" do
      user = build(:user, address: nil)
      user.valid?
      expect(user.errors[:address]).to include("can't be blank")
    end

    # 10. first_nameが半角であれば登録できないこと
    it "is invalid with a first_name hankaku " do
      user = build(:user, first_name: "aaaaa")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

  end
end