class UsersController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]

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
        @user = current_user
    end

    def edit
        @user = User.find_by(id: params[:id])
    end

    def update
        @user = User.find_by(id: params[:id])
        @user.update(update_user_params)
        redirect_to user_path(@user)
    end

    def destroy
        @user = User.find_by(id: params[:id])
        @user.destroy
        session.clear
        redirect_to root_path
    end

    def profile
        @user = current_user
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :password, :email)
    end

    def update_user_params
        params.require(:user).permit(:first_name, :last_name, :email)
    end
end
