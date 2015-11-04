require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  include_context 'region'

  before do
    facts_controller = FactsController.new
    allow(facts_controller).to receive(:params).and_return ActionController::Parameters.new
    allow(helper).to receive(:controller).and_return facts_controller
  end

  it 'derives the region from the controller' do
    expect(helper.region_name).to eq region.name
  end

  it 'regionalizes the translation' do
    expect(helper.region_t('title')).to eq I18n.t("#{region.name}.title")
  end

  it 'regionalizes the path' do
    params = { q: 'a' }
    expect(helper).to receive(:root_path).with(params.merge(region: region.name))
    helper.region_path 'root', params
  end

end
