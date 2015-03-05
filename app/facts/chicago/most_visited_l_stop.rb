module Chicago
  class MostVisitedLStop
    include Updateable
    include ActionView::Helpers::NumberHelper

    def busiest_l_stop
      @busiest ||= Hashie::Mash.new(
        client.select('stationame,sum(monthtotal)')
              .group('stationame')
              .order('sum_monthtotal DESC')
              .limit(1)
              .get(datasets.first.uid)
              .first
      )
    end

    def l_stop_dates
      @dates ||= begin
        client.select('month_beginning')
              .where("stationame = '#{busiest_l_stop.stationame}'")
              .get(datasets.first.uid)
              .map{|m| Time.parse m['month_beginning']}
              .sort
      end
    end

    def datasets
      [ Dataset.find_by(uid: 't2rn-p8d7') ]
    end

    def heading
      I18n.t 'chicago.facts.most_visited_l_stop.heading', stationame: busiest_l_stop.stationame
    end

    def body
      I18n.t('chicago.facts.most_visited_l_stop.body',
        stationame: busiest_l_stop.stationame,
        total: number_with_delimiter(busiest_l_stop.sum_monthtotal),
        oldest_date: l_stop_dates.first.strftime('%m/%d/%Y'),
        latest_date: l_stop_dates.last.strftime('%m/%d/%Y')
      )
    end
  end
end
