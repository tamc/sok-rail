class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_user
  
  private
  
  def set_user
    User.current = user_from_session #|| user_from_cookie || user_from_http_header
  end
  
  def user_from_session
    return nil unless session['user_id']
    User.find(session['user_id'])
  end
end
