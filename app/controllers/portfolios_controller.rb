class PortfoliosController < ApplicationController
    def index
        @user = current_user
        @portfolios = @user.portfolios
    end

    def new 
        @portfolio = current_user.portfolios.build
    end

    def create
        @portfolio = current_user.portfolios.build(portfolios_params)
        if @portfolio.save
            redirect_to user_portfolio_path(current_user, @portfolio)
        else
            render :new
        end
    end

    def show
        @portfolio = Portfolio.find_by(id: params[:id])
    end

    def edit
        @portfolio = Portfolio.find_by(id: params[:id])
    end

    def update
        @portfolio = Portfolio.find_by(id: params[:id])
        @portfolio.update(portfolios_params)
        redirect_to user_portfolio_path(current_user, @portfolio)
    end

    def destroy
        @portfolio = Portfolio.find_by(id: params[:id])
        @portfolio.delete
        redirect_to user_portfolios_path(current_user)
    end

    private
    def portfolios_params
        params.require(:portfolio).permit(:title, :portfolio_type)
    end
end
