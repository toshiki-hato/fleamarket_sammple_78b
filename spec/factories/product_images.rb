FactoryBot.define do

  factory :product_images, class: ProductImage do
    image   {File.open("#{Rails.root}/public/images/test_image.jpg")}
    association  :product, factory: :product
    
  end

end