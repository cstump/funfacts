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
    let(:fact) { build(:fact_with_datasets) }
    let(:datasets) { fact.open_datasets }
    let(:links) { helper.source_links_for fact }

    it 'returns a list of dataset URL links' do
      datasets.map(&:url).each do |url|
        expect(links.any?{|link| link.include url.url }).to be_true
      end
    end
  end

end
