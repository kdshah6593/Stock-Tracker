class SessionsController < ApplicationController

    def new #form for login page
        @user = User.new
    end

    def create #login user
        if @user = User.find_by(username: params[:user][:username])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end
end