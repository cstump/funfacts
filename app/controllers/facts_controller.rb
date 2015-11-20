class FactsController < ApplicationController
  include FactsHelper

  before_action :find_facts

  def index
    respond_to do |format|
      format.html
      format.json do
        render json: {
          facts: serialized_facts,
          last_page: @facts.last_page?
        }
      end
    end
  end


  private

  def find_facts
    @facts = Region.find_by(name: region.name)
                   .facts
                   .page(facts_params[:page])
                   .per facts_per_page
  end

  def facts_params
    params.permit %i(page per)
  end

  def facts_per_page
    facts_params[:per] || Secrets.facts_per_page
  end

end

