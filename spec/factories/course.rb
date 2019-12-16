FactoryGirl.define do
  factory :course do
    name { Faker::Name.name }
    time_load { rand(1..10) }
    price { rand(1000..2000) }
  end
end
