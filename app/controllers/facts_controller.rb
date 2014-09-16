class FactsController < ApplicationController

  def index
    @facts = Region.find_by(name: region.name)
                   .facts
                   .page(facts_params[:page])
                   .per facts_per_page
  end


  private

  def facts_params
    params.permit %i(page per)
  end

  def facts_per_page
    facts_params[:per] || Secrets.facts_per_page
  end

end

