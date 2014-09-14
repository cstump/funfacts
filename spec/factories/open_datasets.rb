FactoryGirl.define do
  factory :chicago_dataset, class: Chicago::Dataset do
    name { Faker::Lorem.words(3).join(' ') }
    uid { "#{Faker::Lorem.characters(4)}-#{Faker::Lorem.characters(4)}" }
    url { Faker::Internet.url }

    factory :dataset_with_facts do
      ignore { facts_count 3 }

      after :create do |dataset, evaluator|
        list = create_list :chicago_fact, evaluator.facts_count
        list.each {|fact| fact.open_datasets << dataset }
      end
    end
  end
end
