FactoryGirl.define do
  factory :chicago_fact, class: Chicago::Fact do
    sequence(:position){|n| n }
    name Faker::Lorem.word
    description Faker::Lorem.sentence
  end
end
