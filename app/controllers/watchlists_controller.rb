class WatchlistsController < ApplicationController

    def index #takes in current user and pulls up all his watchlists
    end

    def new
        @watchlist = Watchlist.new
    end

    def create
        @watchlist = Watchlist.new
    end

    def show 
        @watchlist = Watchlist.find(params[:id])
    end

    def edit
        @watchlist = Watchlist.find(params[:id])
    end

    def update
        @watchlist = Watchlist.find(params[:id])
    end

    def delete 
    end

end
