require_relative 'page_processor'

# Retrieves documents from #url and stores them under #storage_dir
class PageFetcher < PageProcessor

  # @param [String] the URL to retrieve documents from
  # @param [String] the sub directory under #storage_dir
  # where fetched files are saved.
  def initialize(url, storage_sub_dir)
    super
    FileUtils.mkdir_p storage_dir, mode: 0755
  end

  # @param [Range] the range of pages at #url to fetch (inclusive)
  # @return nil. The pages are stored in #storage_dir
  def fetch_range(page_range)
    page_range.each do |i|
      path = page_path suffix: i
      puts path

      begin
        write_page path, fetch_page(i)
      rescue => e
        puts "Could not fetch page #{i}: #{e.message}"
      end

      sleep rand(3)
    end
  end

  # Retrieves page page_num from #url
  # @param page_num [Fixnum]
  # @return [String] the page HTML
  def fetch_page(page_num = nil)
    url = self.url.to_s
    url.gsub!(/page=\d+/, "page=#{page_num}") if page_num
    Faraday.new.get(url).body
  end

  def write_page(path, page_content)
    # write as binary to avoid any encoding issues
    File.open(path, 'wb'){|file| file << page_content }
  end

end
