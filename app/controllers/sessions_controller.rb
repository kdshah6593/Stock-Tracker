class SessionsController < ApplicationController
    skip_before_action :verified_user, except: [:destroy]

    def new #form for login page
        @user = User.new
    end

    def create #login user
    @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:message] = "Invalid Username/Password Combination"
            redirect_to login_path
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end
end