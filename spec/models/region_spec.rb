require 'rails_helper'

RSpec.describe Region, type: :model do
  it { should have_and_belong_to_many :facts }
  it { should have_many :datasets }
  it { should validate_uniqueness_of :name }

  it 'gives the requested region' do
    expect(described_class.chicago).to eq Region.where(name: 'chicago').first
  end
end
