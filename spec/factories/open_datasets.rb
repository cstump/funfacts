FactoryGirl.define do
  factory :chicago_dataset, class: Chicago::Dataset do
    name Faker::Lorem.sentence
    uid "#{Faker::Lorem.characters(4)}-#{Faker::Lorem.characters(4)}"
    url Faker::Internet.url
  end
end
