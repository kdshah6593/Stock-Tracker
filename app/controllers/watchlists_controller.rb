class WatchlistsController < ApplicationController

    def index #takes in current user and pulls up all his watchlists
        @user = current_user
    end

    def new
        @watchlist = Watchlist.new
    end

    def create
        @watchlist = Watchlist.new(params.require(:watchlist).permit(:title))
        @watchlist.user = current_user
        @watchlist.save
        redirect_to watchlist_path(@watchlist)
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

    def destroy 
    end

end
