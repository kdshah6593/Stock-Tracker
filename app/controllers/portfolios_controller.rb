class PortfoliosController < ApplicationController
    before_action :portfolio_find, only: [:show, :edit, :update, :destroy]
    
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
    end

    def edit
    end

    def update
        @portfolio.update(portfolios_params)
        redirect_to user_portfolio_path(current_user, @portfolio)
    end

    def destroy
        @portfolio.delete
        redirect_to user_portfolios_path(current_user)
    end

    private
    def portfolios_params
        params.require(:portfolio).permit(:title, :portfolio_type)
    end

    def portfolio_find
        @portfolio = Portfolio.find_by(id: params[:id])
    end
end
