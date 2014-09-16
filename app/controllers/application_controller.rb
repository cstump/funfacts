class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def region
    Region.chicago #TODO: requested_region || Region.chicago
  end


  private

  def region_param
    params.fetch :region, 'chicago'
  end

  def requested_region
    #TODO: derive region from requested domain if no region parameter is given
    Region.find_by name: region_param
  end
end
