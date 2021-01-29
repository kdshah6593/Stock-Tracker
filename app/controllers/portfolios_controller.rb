class PortfoliosController < ApplicationController
    def index
        @user = User.find_by(id: params[:id])
        @portfolios = @user.portfolios
    end

    def new 

    end

    def create

    end

    def show

    end

    def edit 

    end

    def update

    end

    def destroy
        
    end
end
