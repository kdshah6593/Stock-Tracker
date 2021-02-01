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
        @stock_watchlist = StockWatchlist.new(stock_watchlist_params)
        if @stock_watchlist.save
            redirect_to user_watchlist_path(current_user, @stock_watchlist.watchlist)
        else
            @watchlist = @stock_watchlist.watchlist
            render :'/watchlists/show'
        end
    end


    private
    def stock_watchlist_params
        params.require(:stock_watchlist).permit(:stock_id, :watchlist_id)
    end
end
