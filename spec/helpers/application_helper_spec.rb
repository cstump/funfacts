require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

  before do
    allow(helper).to receive(:controller).and_return Chicago::FactsController.new
  end

  it 'derives the region from the controller name' do
    expect(helper.region).to eq 'chicago'
  end

  it 'derives the title translation from the region' do
    expect(helper.region_t('title')).to eq I18n.t('chicago.title')
  end

  describe '#source_links_for' do
    let(:fact) { build(:fact, datasets_count: 3) }
    let(:datasets) { fact.datasets }
    let(:links) { helper.source_links_for fact }

    it 'returns a list of dataset URL links' do
      datasets.map(&:uri).each do |url|
        expect(links).to include url
      end
    end
  end

end
