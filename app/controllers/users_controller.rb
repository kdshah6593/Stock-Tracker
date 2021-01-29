class UsersController < ApplicationController

    def new  #signup
        @user = User.new
    end

    def create
        @user = User.new(params.require(:user).permit(:first_name, :last_name, :username, :password, :email))
        @user.save
        redirect_to user_path(@user)
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    def edit

    end

    def update

    end

    def destroy

    end

    def profile #need to create a route for this still

    end
end
