FactoryBot.define do
  factory :product do
    name {Faker::Name.last_name}
    description {Faker::Lorem}
    price { "11111" }
    status {Faker::FunnyName}
    shipping_expenses {Faker::Number}
    send_from {Faker::Name.name}
    lead_time {Faker::Date}
    association :user
    association :category
    after(:build) do |product|
      product.product_images << build(:product_images, product: product)
    end 
  end

  factory :productt_no_image, class: Product do
    name {Faker::Name.last_name}
    description {Faker::Lorem}
    price { "11111" }
    status {Faker::FunnyName}
    shipping_expenses {Faker::Number}
    send_from {Faker::Name.name}
    lead_time {Faker::Date}
    association :user
    association :category
  end
end