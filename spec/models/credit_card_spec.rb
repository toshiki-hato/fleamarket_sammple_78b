require 'rails_helper'

describe CreditCard do
  describe '#create' do
  # 1. 全項目が存在すれば登録できること
  it "is valid" do
    credit_card = build(:credit_card)
    expect(credit_card).to be_valid
  end

  # # 2. nameが空では登録できないこと
  # it "is invalid without a user_id" do
  #   product = build(:credit_card, user_id: nil)
  #   product.valid?
  #   expect(product.errors[:user_id]).to include("can't be blank")
  # end
  # # 2. nameが空では登録できないこと
  # it "is invalid without a customer_id" do
  #   product = build(:credit_card, customer_id: nil)
  #   product.valid?
  #   expect(product.errors[:customer_id]).to include("can't be blank")
  # end
  # # 2. nameが空では登録できないこと
  # it "is invalid without a card_id" do
  #   product = build(:credit_card, card_id: nil)
  #   product.valid?
  #   expect(product.errors[:card_id]).to include("can't be blank")
  end
end
