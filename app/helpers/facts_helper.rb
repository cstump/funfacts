module FactsHelper
  def serialized_facts
    ActiveModel::ArraySerializer.new(@facts, each_serializer: FactSerializer).as_json
  end
end
