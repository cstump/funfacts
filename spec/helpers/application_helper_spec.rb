require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

  it 'derives the title translation from the controller name' do
    expect(helper).to receive(:controller).and_return Chicago::FactsController.new
    expect(helper.page_title).to eq I18n.t('chicago.title')
  end

end
