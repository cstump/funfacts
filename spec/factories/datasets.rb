FactoryGirl.define do
  factory :dataset do
    name { Faker::Lorem.words(3).join(' ') }
    sequence(:uri) {|n| Faker::Internet.url + n.to_s }
    uid { "#{Faker::Lorem.characters(4)}-#{Faker::Lorem.characters(4)}" }
  end
end
