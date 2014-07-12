class ChicagoClient < SODA::Client
  include Singleton

  def initialize
    super(
      domain: Secrets.soda.chicago.domain,
      app_token: Secrets.soda.app_token
    )
  end

  def datasets
    Secrets.soda.chicago.datasets
  end
end
