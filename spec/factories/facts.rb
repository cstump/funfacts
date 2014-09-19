FactoryGirl.define do
  factory :fact do
    sequence(:position){|n| n }
    name { Faker::Lorem.word }
    body { Faker::Lorem.sentence(8) }
    heading { Faker::Lorem.sentence }

    ignore do
      regions_count 1
      datasets_count 1
    end

    after :build do |fact, evaluator|
      fact.regions = Region.all.limit(2)
      fact.datasets = create_list :dataset, evaluator.datasets_count
    end

  end
end
