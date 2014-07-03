class ChicagoClient < SODA::Client
  include Singleton

  def initialize
    super(
      domain: Rails.application.secrets.soda['domain'],
      app_token: Rails.application.secrets.soda['app_token']
    )
  end

  def datasets
    Rails.application.secrets.soda['dataset']
  end
end
