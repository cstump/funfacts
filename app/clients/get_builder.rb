class GetBuilder < SODA::Client
  attr_reader :params, :resource

  def initialize(resource = nil, *config)
    @params= {}
    @resource = resource
    super *config
  end

  def respond_to?(symbol, include_all = false)
    true
  end

  def method_missing(name, *args, &block)
    super
  rescue NoMethodError
    @params["$#{name}"] = args.first
    self
  end

  def get(resource = self.resource, params = self.params)
    super
  end
end
