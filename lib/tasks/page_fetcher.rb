class PageFetcher

  attr_reader :storage_dir, :url

  # @param url [String] fully qualified HTTP(S) URL with "page=N" parameter
  def initialize(url)
    @url = URI url
    @storage_dir = Rails.root.join 'tmp', self.url.host
    FileUtils.mkdir_p self.storage_dir, mode: 0755
  end

  # Retrieves page_range pages (inclusive) from #url and stores them under #storage_dir
  # @param page_range [Range]
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
  def fetch_page(page_num = 1)
    RestClient.get url.to_s.gsub(/page=\d+/, "page=#{page_num}")
  end


  private

  def page_name
    url.path[1..-1]
  end

  def page_path(suffix = 1)
    File.join(storage_dir, "#{page_name}.#{suffix}")
  end
end
