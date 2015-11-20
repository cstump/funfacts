require 'rails_helper'

RSpec.describe FactsController, type: :controller do
  include_context 'region'

  let(:facts_per_page) { Secrets.facts_per_page }
  let!(:facts) { create_list :fact, facts_per_page }

  it 'defaults page size to a configurable value' do
    get :index
    expect(assigns(:facts).size).to eq Secrets.facts_per_page
  end

  describe 'JSON response' do
    let(:parsed) { JSON.parse(response.body) }

    it 'serializes the facts' do
      get :index, format: :json
      parsed_facts = parsed['facts']
      expect(parsed_facts.map{|obj| obj['id']}).to match_array facts.map(&:id)
    end

    it 'is the last page' do
      get :index, format: :json
      expect(parsed['last_page']).to be
    end

    it 'is not the last page' do
      get :index, format: :json, per: facts_per_page / 2
      expect(parsed['last_page']).to_not be
    end
  end

  describe 'region setting' do
    it 'defaults the region to chicago if bad region is given' do
      get :index, region: 'ajdj'
      expect(controller.region).to eq Region.chicago
    end

    it 'defaults the region to chicago if no region is given' do
      get :index
      expect(controller.region).to eq Region.chicago
    end
  end

  describe 'with specified page size' do
    let(:facts_per_page) { 5 }
    let!(:facts) { create_list :fact, (facts_per_page + 2)}

    before do
      get :index, per: facts_per_page
    end

    it 'serves the index page' do
      expect(controller).to have_rendered :index
    end

    it 'assigns page size facts' do
      expect(assigns(:facts).size).to eq facts_per_page
    end

    it 'orders the facts by position' do
      expect(assigns(:facts)).to eq(
        Region.find_by(name: region.name)
        .facts
        .page(1)
        .per facts_per_page
      )
    end
  end
end
