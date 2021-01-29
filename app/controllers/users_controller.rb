class UsersController < ApplicationController

    def new  #signup
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            #NEED TO add @user here so we can use error messaging, which needs to be added to new page
            render :new
        end
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

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :password, :email)
    end
end
