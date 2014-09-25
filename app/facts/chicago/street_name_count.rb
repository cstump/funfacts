module Chicago
  class StreetNameCount
    include Updateable

    def datasets
      [ Dataset.find_by(name: 'StreetNames') ]
    end

  end
end
