require 'rails_helper'

describe ChicagoClient do
  let(:api_config) do {
    domain: Secrets.soda.chicago.domain,
    app_token: Secrets.soda.app_token
  } end

  it_should_behave_like 'QueryBuilder'
end
