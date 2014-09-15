class Region < ActiveRecord::Base
  has_and_belongs_to_many :facts
  has_many :datasets, through: :facts

  validates :name, uniqueness: true

  def self.chicago
    where(name: 'chicago').first
  end
end
