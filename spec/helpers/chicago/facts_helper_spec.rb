require 'rails_helper'

RSpec.describe Chicago::FactsHelper, type: :helper do
  let(:fact) { build(:fact_with_datasets) }
  let(:datasets) { fact.open_datasets }

  describe '#source_links_for' do
    let(:links) { helper.source_links_for fact }

    it 'returns a list of dataset URL links' do
      datasets.map(&:url).each do |url|
        expect(links.any?{|link| link.include url.url }).to be_true
      end
    end
  end
end
