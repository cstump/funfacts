class FactsController < ApplicationController

  def index
    @facts = Fact.where(region: region).order('position ASC').page(safe_params[:page]).per facts_per_page
  end


  private

  def safe_params
    params.permit %i(page region per)
  end

  def facts_per_page
    safe_params[:per] || Secrets.facts_per_page
  end

end

