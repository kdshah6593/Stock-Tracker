class UsersController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]
    before_action :user_find, only: [:show, :edit, :update, :destroy]

    def new  #signup
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    def destroy
        @user.destroy
        session.clear
        redirect_to root_path
    end

    def profile
        @user = current_user
    end

    def mostpurchases
        @user = User.mostpurchases
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :password, :email)
    end

    def user_find
        @user = User.find_by(id: params[:id])
        if @user != current_user
            redirect_to user_path(current_user)
        end
    end
end
