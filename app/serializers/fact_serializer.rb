class FactSerializer < ActiveModel::Serializer
  attributes :id, :heading, :body
  has_many :datasets
end
