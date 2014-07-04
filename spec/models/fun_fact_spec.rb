require 'rails_helper'

describe FunFact do
  subject(:fact) { build :fun_fact }

  it { should validate_presence_of :name }
  it { should validate_presence_of :description }

  it 'auto assigns a position' do
    fact.position = nil
    fact.save!
    expect(fact.position).to eq 1
  end

  it 'increments the position on auto assign' do
    3.times{ create :fun_fact }
    expect(described_class.last.position).to eq 3
  end
end
