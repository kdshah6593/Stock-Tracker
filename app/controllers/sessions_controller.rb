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

    def omniauth #login with 3rd party
        @user = User.find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |u|
            name = auth["info"]["name"].split
            u.email = auth["info"]["email"]
            u.username = auth["info"]["nickname"]
            u.first_name = name[0]
            u.last_name = name[1]
            u.password = SecureRandom.hex(16)
        end
        byebug
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:message] = "Oops, something went wrong!"
            redirect_to login_path
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end