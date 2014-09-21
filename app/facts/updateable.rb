module Updateable

  def update!
    fact = Fact.find_or_initialize_by name: self.class.name
    fact.datasets = datasets
    fact.regions = regions
    fact.body = body
    fact.heading = heading
    fact.save!
    fact
  end

  def regions
    [ Region.chicago ]
  end

  def datasets
    []
  end

  def heading
    ""
  end

  def body
    ""
  end

  def client
    ChicagoClient.new
  end

end
