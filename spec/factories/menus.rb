FactoryGirl.define do
  factory :menu do
    title          { Faker::Lorem.characters(rand(3..50)) }
    price          { Faker::Number.positive(1.00, 50.00) }
    association :category, factory: :category
  end
end
