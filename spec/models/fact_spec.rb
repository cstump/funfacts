require 'rails_helper'

RSpec.describe Fact, type: :model do

  subject(:fact) { build :fact }

  it { should have_and_belong_to_many :datasets }
  it { should have_and_belong_to_many :regions }
  it { should validate_presence_of :name }

  it 'auto assigns a position' do
    fact.position = nil
    fact.save!
    expect(fact.position).to be_present
    expect(fact.position).to be > 0
  end

  it 'increments the position on auto assign' do
    3.times{ create :fact }
    expect(described_class.last.position).to be >= 3
  end

  it 'requires a dataset' do
    fact.datasets = []
    expect(fact).to_not be_valid
    expect(fact.errors[:datasets]).to be_present
  end

  it 'requires a region' do
    fact.regions = []
    expect(fact).to_not be_valid
    expect(fact.errors[:regions]).to be_present
  end

  it 'requires a body or heading' do
    fact.body = fact.heading = nil
    expect(fact).to_not be_valid
    expect(fact.errors[:base]).to be_present
  end

end
