require_relative 'page_processor'

# Retrieves documents from #url and stores them under #storage_dir
class PageFetcher < PageProcessor

  # @param [String] the URL to retrieve documents from
  def initialize(url)
    super
    FileUtils.mkdir_p self.storage_dir, mode: 0755
  end

  # @param [Range] the range of pages at #url to fetch (inclusive)
  # @return nil. The pages are stored in #storage_dir
  def fetch(page_range)
    page_range.each do |i|
      path = page_path i
      puts path
      File.open(path, 'w'){|file| file << fetch_page(i) }
      sleep rand(3)
    end
  end

  # Retrieves page page_num from #url
  # @param page_num [Fixnum]
  # @return [String] the page HTML
  def fetch_page(page_num = nil)
    url = self.url.to_s
    url.gsub!(/page=\d+/, "page=#{page_num}") if page_num
    RestClient.get url
  end

end
