module Chicago
  class FactsController < ApplicationController

    FACTS_PER_PAGE = Secrets.chicago.facts_per_page

    def index
      @facts = Fact.order('position ASC').page(params[:page]).per FACTS_PER_PAGE
    end

  end
end
