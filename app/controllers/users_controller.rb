class UsersController < ApplicationController

    def new  #signup
        @user = User.new
    end

    def create
        @user = User.new(params.require(:user).permit(:first_name, :last_name, :username, :password, :email)
        @user.save
        redirect_to watchlists_path
    end
end
