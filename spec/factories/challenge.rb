FactoryGirl.define do
  factory :challenge do
    name { Faker::Name.name }
    content { { first_quarter: '1984', second_quarter: 'Titanic' }.to_json }
  end
end
