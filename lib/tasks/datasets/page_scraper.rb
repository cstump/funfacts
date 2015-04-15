require_relative 'page_processor'

# Scrapes HTML documents previously downloaded by a PageFetcher
class PageScraper < PageProcessor

  # @param [Hash] CSS selector keys, Array values
  # @param [String] path to an HTML file
  # @return [Hash] the same selectors parameter with each
  # Array value containing the Nokogiri nodes selected
  # by the CSS selector keys in the file at path
  def scrape_page(selectors, path)
    selectors.keys.each do |css_selector|
      doc = parse_page path
      selectors[css_selector] ||= []
      selectors[css_selector] << doc.css(css_selector)
    end

    selectors.each{|k,v| selectors[k] = v.flatten }
    selectors
  end

  # Process files in #storage_dir
  # @param [Hash] same as described for #scrape_page
  # @param [Range] the range of pages to scrape (inclusive)
  # @return [Hash] same as described for #scrape_page
  def scrape_range(selectors, page_range)
    page_range.each do |i|
      path = page_path suffix: i
      puts path
      scrape_page selectors, path
    end

    selectors
  end

  # Process all files in #storage_dir
  # @param [Hash] same as described for #scrape_page
  # @return [Hash] same as described for #scrape_page
  def scrape_all(selectors)
    all_pages.each do |page|
      puts page
      scrape_page selectors, page
    end

    selectors
  end


  private

  def all_pages
    Dir[ page_path(suffix: '*') ]
  end

  def parse_page(path)
    Nokogiri::HTML::Document.parse File.new(path)
  end
end
