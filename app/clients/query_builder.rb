#
# Enables different query styles for accessing SODA
#
# Client.new.get 't2rn-p8d7', '$select' => 'stationame,sum(monthtotal)', '$group' => 'stationame', '$limit' => 10
# Client.new('t2rn-p8d7').select('stationame,sum(monthtotal)').group('stationame').limit(10).get
# Client.new.select('stationame,sum(monthtotal)').group('stationame').limit(10).get('t2rn-p8d7')
class QueryBuilder < SODA::Client
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
