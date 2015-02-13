RSpec.shared_examples_for 'QueryBuilder' do
  let(:resource) { 't2rn-p8d7' }

  let(:params) do {
    '$select' => 'stationame,sum(monthtotal)',
    '$group' => 'stationame',
    '$order' => 'sum_monthtotal DESC',
    '$limit' => 10
  } end

  subject(:builder) { described_class.new resource}


  it 'responds to anything' do
    expect(builder).to respond_to rand().to_s
  end
  
  
  describe 'initialization' do
    it 'sets params to an empty Hash' do
      expect(builder.params).to eq({})
    end

    it 'sets the resource' do
      expect(builder.resource).to eq resource
    end

    xit 'properly initializes the super class' do
      expect_any_instance_of(QueryBuilder).to receive(:initialize).with(resource, api_config)
      described_class.new resource
    end

    xit "properly initializes grandsuper class" do
      expect_any_instance_of(SODA::Client).to receive(:initialize).with(api_config)
      described_class.new resource
    end
  end

  
  describe 'query building' do
    before do
      builder.select(params['$select']).group(params['$group']).order(params['$order']).limit(params['$limit'])
    end

    it 'defers to grandsuper before considering a method call as a query build' do
      expect(SODA::Client.instance_methods - builder.methods).to be_empty
    end

    it 'builds query parameters' do
      expect(builder.params).to eq params
    end

    it "defers to grandsuper's #get" do
      expect_any_instance_of(SODA::Client).to receive(:get).with(resource, params)
      builder.get
    end
  end
end
