class ChicagoClient < QueryBuilder

  def initialize(resource = nil)
    super(
      resource,
      domain: Secrets.soda.chicago.domain,
      app_token: Secrets.soda.app_token
    )
  end
end
