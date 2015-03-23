FactoryGirl.define do
  factory :column do
    name { Faker::Lorem.word }
  end
end
