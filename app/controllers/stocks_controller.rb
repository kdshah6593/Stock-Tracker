class StocksController < ApplicationController

    def index
        @stocks = Stock.all
    end

    def show 
        @stock = Stock.find_by(id: params[:id])
    end

    def new #this is form to add a stock to watchlist #possibly don't need since form built into watchlist show page
    end

    def create #this is to add a stock to watchlist
        raise params.inspect
        @stock_watchlist = StockWatchlist.new()
    end


    private
    def stock_watchlist_params
        params.require(:stock_watchlist).permit(:stock_id, :watchlist_id)
    end
end
