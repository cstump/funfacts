require_relative 'page_fetcher'
require_relative 'page_scraper'

class DatasetGrabber

  attr_accessor :city

  def initialize(city = nil)
    self.city = city
  end

  def grab_datasets(first_page, last_page)
    fetcher = PageFetcher.new Secrets.datasets.send(city).index_url, 'datasets'
    fetcher.fetch_range Range.new(first_page, last_page)
  end

  def load_datasets(first_page, last_page, dataset_url_selector)
    scraper = PageScraper.new Secrets.datasets.send(city).index_url, 'datasets'
    selectors = { dataset_url_selector => [] }

    if first_page && last_page
      scraper.scrape_range selectors, Range.new(first_page, last_page)
    else
      scraper.scrape_all selectors
    end

    update_datasets *selectors.values.first
  end

  def grab_columns
  end

  def load_columns
    # for each dataset
    # parse each column description file
    # destroy all columns of dataset
    # recreate all dataset columns from file
  end


  private

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

end
