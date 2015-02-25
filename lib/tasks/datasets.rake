require_relative 'page_fetcher'

namespace :ff do
  namespace :datasets do

    desc <<-DESC
      Retrieves the index pages of city datasets. The index URL is configured
      in secrets.yml under datasets/<city name>/index_url. The URL is expected
      to contain a "page=N" parameter. Retrieved HTML is stored under tmp.
    DESC
    task :fetch, %i(first_page last_page city) => :environment do |t, args|
      args.with_defaults city: 'chicago'
      fetcher = PageFetcher.new Secrets.datasets.send(args.city).index_url
      fetcher.fetch Range.new(args.first_page, args.last_page)
    end

  end
end
