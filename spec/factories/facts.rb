FactoryGirl.define do
  factory :fact do
    region Regions::CHICAGO
    sequence(:position){|n| n }
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }

    ignore { datasets_count 1 }

    after :build do |fact, evaluator|
      fact.datasets = create_list :dataset, evaluator.datasets_count
      fact.datasets.each {|dataset| dataset.facts << fact }
    end

  end
end
