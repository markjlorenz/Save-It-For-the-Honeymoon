class ApplicationController < ActionController::Base
  include Clearance::Authentication
  protect_from_forgery
  after_filter :no_xhr_flashes

  def no_xhr_flashes
    flash.discard if request.xhr?
  end
end
