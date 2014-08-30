module Chicago
  class MostVisitedLStop
    include ActionView::Helpers::NumberHelper

    def update
      fact = Chicago::Fact.find_or_initialize_by name: self.class.name
      fact.open_datasets << dataset
      fact.description = fact_text
      fact.save!
      fact
    end


    private
    
    def client
      ChicagoClient.new
    end

    def dataset
      @dataset ||= Chicago::Dataset.where(name: 'LStationEntries').first
    end

    def busiest_l_stop
      @busiest ||= Hashie::Mash.new(
        client.select('stationame,sum(monthtotal)')
              .group('stationame')
              .order('sum_monthtotal DESC')
              .limit(1)
              .get(dataset.uid)
              .first
      )
    end

    def l_stop_dates
      @dates ||= begin
        client.select('month_beginning')
              .where("stationame = '#{busiest_l_stop.stationame}'")
              .get(dataset.uid)
              .map{|m| Time.parse m['month_beginning']}
              .sort
      end
    end

    def fact_text
      I18n.t('most_visited_l_stop.description',
        stationame: busiest_l_stop.stationame,
        total: number_with_delimiter(busiest_l_stop.sum_monthtotal),
        oldest_date: l_stop_dates.first.strftime('%m/%d/%Y'),
        latest_date: l_stop_dates.last.strftime('%m/%d/%Y')
      )
    end
  end
end
