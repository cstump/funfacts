module Chicago
  class FactsController < ApplicationController

    FACTS_PER_PAGE = 5

    def index
      @facts = Chicago::Fact.order('position ASC').page(params[:page]).per FACTS_PER_PAGE
    end

  end
end
