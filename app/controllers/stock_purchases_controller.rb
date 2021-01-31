class StockPurchasesController < ApplicationController

    def new
        @portfolio = Portfolio.find_by(id: params[:portfolio_id])
        @stock_purchase = @portfolio.stock_purchases.build
    end

    def create
        @portfolio = Portfolio.find_by(id: params[:portfolio_id])
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
end
