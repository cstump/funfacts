require_relative 'datasets/page_fetcher'
require_relative 'datasets/page_scraper'

namespace :ff do
  namespace :datasets do

    def fetcher_for(city)
      PageFetcher.new Secrets.datasets.send(city).index_url
    end

    def scraper_for(city)
      PageScraper.new Secrets.datasets.send(city).index_url
    end

    desc <<-DESC
      Retrieves the index pages of city datasets. The index URL is configured
      in secrets.yml under datasets/<city name>/index_url. The URL is expected
      to contain a "page=N" parameter. Retrieved HTML is stored under tmp.
    DESC
    task :fetch, %i(first_page last_page city) => :environment do |t, args|
      args.with_defaults city: 'chicago'
      fetcher_for(args.city).fetch Range.new(args.first_page, args.last_page)
    end

    def update_datasets(*nodes)
      nodes.each do |selection|
        uri = selection.attribute('href').value
        uid = uri.split('/').last
        name = selection.content
        dataset = Dataset.find_or_initialize_by uid: uid
        dataset.attributes = { uri: uri, name: name }
        dataset.save!
      end
    end

    desc <<-DESC
      Scrapes the pages previously downloaded by task :fetch for dataset information.
      Processes the dataset information and stores it in a Dataset.
    DESC
    task :load, %i(first_page last_page city dataset_url_selector) => :environment do |t, args|
      args.with_defaults city: 'chicago', dataset_url_selector: '.results a.name'
      scraper = scraper_for args.city
      selectors = { args.dataset_url_selector => [] }

      if args.first_page && args.last_page
        scraper.scrape selectors, Range.new(args.first_page, args.last_page)
      else
        scraper.scrape_all selectors
      end

      update_datasets *selectors.values.first
    end

  end
end
