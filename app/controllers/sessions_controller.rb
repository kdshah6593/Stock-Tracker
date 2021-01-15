class SessionsController < ApplicationController

    def new #log in page
        @user = User.new
    end

    def create #login user
        @user = User.find_by(username: params[:user][:username])
        session[:user_id] = @user.index
        redirect_to watchlists_path
    end

    def logout
    end
end