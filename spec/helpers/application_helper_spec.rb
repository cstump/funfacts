require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

  before do
    expect(helper).to receive(:controller).and_return Chicago::FactsController.new
  end

  it 'derives the title translation from the controller name' do
    expect(helper.page_title).to eq I18n.t('chicago.title')
  end

  it 'derives the region from the controller name' do
    expect(helper.region).to eq 'chicago'
  end

end
