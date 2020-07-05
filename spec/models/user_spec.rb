require 'rails_helper'

describe User do
  describe '#create' do

    # 1. 全項目が存在すれば登録できること
    it "is valid" do
      product = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without an email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    
    it "is invalid without an first_name" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "is invalid without an first_name" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "is invalid without an last_name" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "is invalid without an first_name_phonetic" do
      user = build(:user, first_name_phonetic: "")
      user.valid?
      expect(user.errors[:first_name_phonetic]).to include("can't be blank")
    end

    it "is invalid without an last_name_phonetic" do
      user = build(:user, last_name_phonetic: "")
      user.valid?
      expect(user.errors[:last_name_phonetic]).to include("can't be blank")
    end
    
    it "is invalid without an birthday" do
      user = build(:user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

    it "is invalid without an password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without an encrypted_password" do
      user = build(:user, encrypted_password: "")
      user.valid?
      expect(user.errors[:encrypted_password]).to include("can't be blank")
    end

    it "is invalid without an send_first_name" do
      user = build(:user, send_first_name: "")
      user.valid?
      expect(user.errors[:send_first_name]).to include("can't be blank")
    end

    it "is invalid without an send_last_name" do
      user = build(:user, send_last_name: "")
      user.valid?
      expect(user.errors[:send_last_name]).to include("can't be blank")
    end

    it "is invalid without an send_first_name_phonetic" do
      user = build(:user, send_first_name_phonetic: "")
      user.valid?
      expect(user.errors[:send_first_name_phonetic]).to include("can't be blank")
    end

    it "is invalid without an send_last_name_phonetic" do
      user = build(:user, send_last_name_phonetic: "")
      user.valid?
      expect(user.errors[:send_last_name_phonetic]).to include("can't be blank")
    end

    it "is invalid without an postal_code" do
      user = build(:user, postal_code: "")
      user.valid?
      expect(user.errors[:postal_code]).to include("can't be blank")
    end

    it "is invalid without an prefectures" do
      user = build(:user, prefectures: "")
      user.valid?
      expect(user.errors[:prefectures]).to include("can't be blank")
    end

    it "is invalid without an city" do
      user = build(:user, city: "")
      user.valid?
      expect(user.errors[:city]).to include("can't be blank")
    end

    it "is invalid without an address" do
      user = build(:user, address: "")
      user.valid?
      expect(user.errors[:address]).to include("can't be blank")
    end

  end
end