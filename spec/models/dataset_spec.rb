require 'rails_helper'

RSpec.describe Dataset, type: :model do

  subject(:dataset) { build :chicago_dataset }

  it { should have_and_belong_to_many :fun_facts }
  it { should validate_presence_of :uid }
  it { should validate_presence_of :url }

end
