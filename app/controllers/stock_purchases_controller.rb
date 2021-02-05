class StockPurchasesController < ApplicationController
    before_action :portfolio_find, only: [:new, :create]

    def new
        @stock_purchase = @portfolio.stock_purchases.build
    end

    def create
        @stock_purchase = @portfolio.stock_purchases.build(stock_purchase_params)
        if @stock_purchase.save
            redirect_to user_portfolio_path(current_user, @stock_purchase.portfolio)
        else
            render :new
        end
    end

    def destroy
        @stock_purchase = StockPurchase.find_by(id: params[:id])
        @stock_purchase.destroy
        redirect_to user_portfolio_path(current_user, @stock_purchase.portfolio)
    end

    private
    def stock_purchase_params
        params.require(:stock_purchase).permit(:amount, :cost, :stock_id, :portfolio)
    end

    def portfolio_find
        @portfolio = Portfolio.find_by(id: params[:portfolio_id])
        if @portfolio.user != current_user
            redirect_to user_path(current_user)
        end
    end
end
