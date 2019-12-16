FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    surname { Faker::Name.last_name }
    birthdate { '1996-09-21' }
    email { Faker::Internet.email }
    address { Faker::Address.street_address }
    phone { Faker::PhoneNumber.phone_number }
  end
end
