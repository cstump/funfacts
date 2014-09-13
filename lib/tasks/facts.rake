namespace :ff do

  task update_facts: :environment do
    def facts_dir
      @facts_dir ||= Rails.root.join('app', 'facts')
    end

    def file_to_class(file_path)
      file_path.gsub(/#{facts_dir.to_s}|\.rb/, '').classify.constantize
    end

    Dir[ facts_dir.join('**', '*.rb') ].each do |fact_file|
      begin
        file_to_class(fact_file).new.update!
      rescue => e
        puts "#{fact_file} failed to update!: #{e.message}\n#{e.backtrace.join("\n")}"
      end
    end
  end


  task :seed_dummy_data, [:fact_count] => :environment do |t, args|
    args.fact_count.to_i.times do
      FactoryGirl.create :fact_with_datasets, datasets_count: rand(1..10)
    end
  end

end