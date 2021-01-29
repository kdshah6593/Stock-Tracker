class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?

#establishes current user using the session id after login request
  def current_user
    @current_user ||= @current_user = User.find(session[:user_id]) if session[:user_id]
  end
  
#want this to evaluate for truthiness, so use double bang
  def logged_in?
    !!current_user
  end

end
