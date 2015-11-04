class DatasetSerializer < ActiveModel::Serializer
  attributes :id, :uri, :name

  def name
    object.name.underscore.humanize
  end
end
