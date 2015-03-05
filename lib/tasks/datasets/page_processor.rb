class PageProcessor

  attr_reader :storage_dir, :url

  # @param url [String] fully qualified HTTP(S) URL with "page=N" parameter
  def initialize(url)
    @url = URI url
    @storage_dir = Rails.root.join 'tmp', self.url.host
  end

  def page_name
    url.path[1..-1]
  end

  def page_path(suffix = 1)
    File.join(storage_dir, "#{page_name}.#{suffix}")
  end

end
