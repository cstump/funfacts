require 'rails_helper'

RSpec.describe Chicago::MostVisitedLStop, vcr: { cassette_name: 'most visited l stop' } do

  subject(:fact) { described_class.new }

  describe 'after update' do
    before { fact.update }

    it 'creates a fun fact' do
      expect(Chicago::Fact.count).to eq 1
    end

    it 'updates the existing fact instead of creating a new one' do
      expect{
        fact.update
      }.to_not change{ Chicago::Fact.count }
    end

    it 'requests the right resource' do
      url = /https:\/\/data.cityofchicago.org\/resource\/t2rn-p8d7.json?.+/
      expect(a_request(:get, url)).to have_been_made.twice
    end
  end

  describe 'the resulting FunFact' do
    let(:fun_fact) { fact.update }

    it 'sets the description' do
      expect(I18n).to receive(:t).with('most_visited_l_stop.description', anything).and_call_original
      expect(fun_fact.description).to be_present
    end

    it 'sets the name' do
      expect(fun_fact.name).to eq described_class.name
    end

    it 'associates the fact with the dataset' do
      expect(fun_fact.open_datasets.size).to eq 1
      expect(fun_fact.open_datasets.first).to eq Chicago::Dataset.where(name: 'LStationEntries').first
    end
  end
end
