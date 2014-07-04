FactoryGirl.define do
  factory :fun_fact do
    sequence(:position){|n| n }
    name Faker::Lorem.word
    description Faker::Lorem.sentence
  end
end
