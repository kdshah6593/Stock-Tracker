class StocksController < ApplicationController
    before_action :stock_find, only: [:show, :destroy]

    def index
        @stocks = Stock.search(params[:search])
    end

    def show 
    end

    def new #this is form to add a stock to watchlist #possibly don't need since form built into watchlist show page
    end

    def create #this is to add a stock to watchlist
        @stock_watchlist = StockWatchlist.new(stock_watchlist_params)
        @watchlist = @stock_watchlist.watchlist
        @stock = @stock_watchlist.stock
        if @watchlist.stocks.include?(@stock)
            flash[:message] = "This stock is already in your watchlist"
            redirect_to user_watchlist_path(current_user, @watchlist)
        else
            if @stock_watchlist.save
                redirect_to user_watchlist_path(current_user, @watchlist)
            else
                render :'/watchlists/show'
            end
        end
    end

    def destroy #removes stock from a watchlist
        @watchlist = Watchlist.find_by(id: params[:watchlist_id])
        @watchlist.stocks.delete(@stock)
        redirect_to user_watchlist_path(current_user, @watchlist)
    end

    def sector
        @stocks = Stock.sector(params[:sector])
    end

    private
    def stock_watchlist_params
        params.require(:stock_watchlist).permit(:stock_id, :watchlist_id)
    end

    def stock_find
        @stock = Stock.find_by(id: params[:id])
    end
end
