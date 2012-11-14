class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  helper :all

  alias_method :logged_in?, :signed_in?
  helper_method :logged_in?

  def record_not_found
    render template: '/error/error_404', status: 404, layout: 'application'
  end

  def verify_admin
    redirect_to root_path unless current_user.try(:admin?)
  end

  protect_from_forgery
end
