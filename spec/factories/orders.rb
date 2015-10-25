FactoryGirl.define do
  factory :order do
    name           {Faker::Lorem.characters(rand(3..50))}
    price          {Faker::Number.positive(1.00,50.00)} 
    email          {Faker::Internet.email}
    #association :category, factory: :category
  end
end
