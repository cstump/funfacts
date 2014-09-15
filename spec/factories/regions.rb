FactoryGirl.define do
  factory :region do
    sequence(:name) {|n| Faker::Lorem.word + n.to_s }
  end
end
