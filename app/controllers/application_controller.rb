class ApplicationController < ActionController::Base

    helpers do
        #want this to evaluate for truthiness, so use double bang
        def logged_in?
          !!current_user
        end
    
        #establishes current user using the session id after login request
        def current_user
          @current_user ||= @current_user = User.find(session[:user_id]) if session[:user_id]
        end
    end
end
