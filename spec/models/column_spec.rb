require 'rails_helper'

RSpec.describe Column, type: :model do
  subject(:column) { build :column }

  it { should have_and_belong_to_many :datasets }
end
