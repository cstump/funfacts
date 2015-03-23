require 'rails_helper'

RSpec.describe Dataset, type: :model do

  subject(:dataset) { build :dataset }

  it { should have_and_belong_to_many :facts }
  it { should have_and_belong_to_many :columns }
  it { should validate_presence_of :name }
  it { should validate_presence_of :uid }
  it { should validate_uniqueness_of :uri }

end
