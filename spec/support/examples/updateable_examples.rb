shared_examples_for 'updateable' do
  
  describe 'after update' do
    before { subject.update! }

    it 'creates a fun fact' do
      expect(Fact.count).to eq 1
    end

    it 'updates the existing fact instead of creating a new one' do
      expect{
        subject.update!
      }.to_not change{ Fact.count }
    end    
  end

  describe 'the resulting FunFact' do
    let(:fun_fact) { subject.update! }

    it 'sets the body' do            
      expect(fun_fact.body).to be_present      
    end
    
    it 'sets the heading' do
      expect(fun_fact.heading).to be_present
    end

    it 'sets the name' do
      expect(fun_fact.name).to eq described_class.name
    end

    it 'associates the fact with the dataset' do
      expect(fun_fact.datasets.size).to eq 1
      expect(fun_fact.datasets.first).to eq Dataset.where(name: 'LStationEntries').first
    end
  end

end
