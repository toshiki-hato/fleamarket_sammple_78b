require 'rails_helper'
describe Product do
  describe '#create' do
    # 1. 全項目が存在すれば登録できること
    it "is valid" do
      product = build(:product)
      expect(product).to be_valid
    end

    # 2. nameが空では登録できないこと
    it "is invalid without a name" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end

    # 3. descriptionが空では登録できないこと
    it "is invalid without a description" do
      product = build(:product, description: nil)
      product.valid?
      expect(product.errors[:description]).to include("を入力してください")
    end

    # 4. priceが空では登録できないこと
    it "is invalid without a price" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("は数値で入力してください")
    end

    # 5. statusが空では登録できないこと
    it "is invalid without a status" do
      product = build(:product, status: nil)
      product.valid?
      expect(product.errors[:status]).to include("を入力してください")
    end

    # 6. shipping_expensesが空では登録できないこと
    it "is invalid without a shipping_expenses" do
      product = build(:product, shipping_expenses: nil)
      product.valid?
      expect(product.errors[:shipping_expenses]).to include("を入力してください")
    end

    # 7. send_fromが空では登録できないこと
    it "is invalid without a send_from" do
      product = build(:product, send_from: nil)
      product.valid?
      expect(product.errors[:send_from]).to include("を入力してください")
    end

    # 8. lead_timeが空では登録できないこと
    it "is invalid without a lead_time" do
      product = build(:product, lead_time: nil)
      product.valid?
      expect(product.errors[:lead_time]).to include("を入力してください")
    end

    # 9. imageが空では登録できないこと
    it "is invalid without a image" do
      productt_no_image = build(:productt_no_image)
      productt_no_image.valid?
      expect(productt_no_image.errors[:product_image]).to include()
    end
  end
end