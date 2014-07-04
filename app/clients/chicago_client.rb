class ChicagoClient < SODA::Client
  include Singleton

  def initialize
    super(
      domain: Secrets.instance.soda.chicago.domain,
      app_token: Secrets.instance.soda.app_token
    )
  end

  def datasets
    Secrets.instance.soda.chicago.datasets
  end
end
