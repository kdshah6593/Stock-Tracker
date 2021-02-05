class ApplicationController < ActionController::Base
  before_action :verified_user
  helper_method :logged_in?, :current_user, :verified_user, :correct_user

#establishes current user using the session id after login request
  def current_user
    @current_user ||= @current_user = User.find(session[:user_id]) if session[:user_id]
  end
  
#want this to evaluate for truthiness, so use double bang
  def logged_in?
    !!current_user
  end

#want this to verify if user is logged in otherwise redirect to login
  def verified_user
    redirect_to root_path unless logged_in?
  end

end
