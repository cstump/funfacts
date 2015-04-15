class PageProcessor

  attr_accessor :storage_dir, :url

  # @param url [String] fully qualified HTTP(S) URL
  # @param storage_sub_dir [String] sub directory under #storage_dir
  def initialize(url, storage_sub_dir)
    @url = URI url
    @storage_dir = Rails.root.join 'tmp', self.url.host, storage_sub_dir
  end

  def page_name(path_range = 1..-1)
    url.path[path_range]
  end

  def page_path(name: page_name, suffix: 1)
    File.join(storage_dir, "#{name}.#{suffix}")
  end

end
