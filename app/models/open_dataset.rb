class OpenDataset < ActiveRecord::Base
  has_and_belongs_to_many :fun_facts

  validates :uid, :url, presence: true
end
