class StocksController < ApplicationController

    def index
        @stocks = Stock.search(params[:search])
    end

    def show 
        @stock = Stock.find_by(id: params[:id])
    end

    def new #this is form to add a stock to watchlist #possibly don't need since form built into watchlist show page
    end

    def create #this is to add a stock to watchlist
        @stock_watchlist = StockWatchlist.new(stock_watchlist_params)
        if @stock_watchlist.watchlist.stocks.size < 3
            if @stock_watchlist.save
                redirect_to user_watchlist_path(current_user, @stock_watchlist.watchlist)
            else
                @watchlist = @stock_watchlist.watchlist
                render :'/watchlists/show'
            end
        else
            flash[:message] = "I'm sorry, currently the app limits a watchlist to 3 stocks"
            render :'/watchlists/show'
        end
    end

    def destroy
        @watchlist = Watchlist.find_by(id: params[:watchlist_id])
        @stock = Stock.find_by(id: params[:id])
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
end
