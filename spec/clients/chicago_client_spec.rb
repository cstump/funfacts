describe ChicagoClient do

  subject(:client) { described_class.instance }

  it 'is a Singleton' do
    expect(described_class.included_modules).to include Singleton
  end

  it 'gives easy access to the dataset config' do
    expect(client.datasets).to eq Secrets.instance.soda.chicago.datasets
  end

end
