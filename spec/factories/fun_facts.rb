FactoryGirl.define do
  factory :chicago_fact, class: Chicago::Fact do
    sequence(:position){|n| n }
    name Faker::Lorem.word
    description Faker::Lorem.sentence

    factory :fact_with_datasets do
      ignore { datasets_count 3 }

      after :create do |fact, evaluator|
        create_list :chicago_dataset, evaluator.datasets_count, fun_fact: fact
      end
    end
  end
end
