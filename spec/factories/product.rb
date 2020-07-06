FactoryBot.define do
  factory :product do
    name {Faker::Name.last_name}
    description {Faker::Lorem}
    price {Faker::Number}
    status {Faker::FunnyName}
    shipping_expenses {Faker::Number}
    send_from {Faker::Name.name}
    lead_time {Faker::Date}
    after(:build) do |product|
      product.product_images << build(:product_images, product: product)
    end 
  end

  factory :productt_no_image, class: Product do
    name {Faker::Name.last_name}
    description {Faker::Lorem}
    price {Faker::Number}
    status {Faker::FunnyName}
    shipping_expenses {Faker::Number}
    send_from {Faker::Name.name}
    lead_time {Faker::Date}
  end
end