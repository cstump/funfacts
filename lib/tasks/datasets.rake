require_relative 'datasets/dataset_grabber'

namespace :ff do
  namespace :datasets do
    desc <<-DESC
      Retrieves the index pages of city datasets. The index URL is configured
      in secrets.yml under datasets/<city name>/index_url. The URL is expected
      to contain a "page=N" parameter. Retrieved HTML is stored under tmp.
    DESC
    task :grab, %i(first_page last_page city) => :environment do |t, args|
      args.with_defaults city: 'chicago'
      DatasetGrabber.new(args.city).grab_datasets args.first_page, args.last_page
    end

    desc <<-DESC
      Scrapes the pages previously downloaded by task :fetch for dataset information.
      Processes the dataset information and stores it in a Dataset.
    DESC
    task :load, %i(first_page last_page city dataset_url_selector) => :environment do |t, args|
      args.with_defaults city: 'chicago', dataset_url_selector: '.results a.name'
      DatasetGrabber.new(args.city).load_datasets args.first_page, args.last_page, args.dataset_url_selector
    end

    task :update, %i(first_page last_page) => %w(ff:datasets:grab ff:datasets:load)

    namespace :columns do
      desc <<-DESC
      DESC
      task :grab, %i(city) => :environment do |t, args|
        args.with_defaults city: 'chicago'
      end

      task :load => :environment do |t, args|
      end

      task update: %w(ff:datasets:columns:grab ff:datasets:columns:load)
    end
  end
end
