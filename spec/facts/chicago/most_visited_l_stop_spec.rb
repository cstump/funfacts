require 'rails_helper'

RSpec.describe Chicago::MostVisitedLStop, vcr: { cassette_name: 'most visited l stop' } do
  it_should_behave_like 'updateable'

  let!(:dataset) { Dataset.find_or_initialize_by uid: 't2rn-p8d7' }

  subject(:fact) { described_class.new }

  it 'requests the right resource' do
    fact.update!
    url = /https:\/\/data.cityofchicago.org\/resource\/t2rn-p8d7.json?.+/
    expect(a_request(:get, url)).to have_been_made.twice
  end

  it 'requests the correct translations' do
    expect(I18n).to receive(:t).with('chicago.facts.most_visited_l_stop.body', anything).and_call_original
    expect(I18n).to receive(:t).with('chicago.facts.most_visited_l_stop.heading', anything).and_call_original
    fact.update!
  end
end
