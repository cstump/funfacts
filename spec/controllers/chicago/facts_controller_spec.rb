require 'rails_helper'

RSpec.describe Chicago::FactsController, type: :controller do

  before do
    (described_class::FACTS_PER_PAGE + 2).times { create :fact }
    get :index
  end

  it 'is a configurable value' do
    expect(described_class::FACTS_PER_PAGE).to eq Secrets.chicago.facts_per_page
  end

  it 'services the index page' do
    should render_template :index
  end

  it 'assigns FACTS_PER_PAGE facts' do
    expect(assigns(:facts).size).to eq described_class::FACTS_PER_PAGE
  end

  it 'orders the facts by position' do
    expect(assigns(:facts)).to eq Fact.order('position ASC').page(1).per(described_class::FACTS_PER_PAGE)
  end

end
