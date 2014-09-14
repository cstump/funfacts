require 'rails_helper'

RSpec.describe Fact, type: :model do

  subject(:fact) { build :fact }

  it { should have_and_belong_to_many :datasets }
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }

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

end