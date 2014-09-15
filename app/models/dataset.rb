class Dataset < ActiveRecord::Base
  has_and_belongs_to_many :facts

  validates :name, :uid, presence: true
  validates :uri, uniqueness: true
end
