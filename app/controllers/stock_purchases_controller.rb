class StockPurchasesController < ApplicationController

    def new
        @portfolio = Portfolio.find_by(id: params[:portfolio_id])
        @stock_purchase = @portfolio.stock_purchases.build
    end

    def create
    end

    def destroy
        
    end
end
