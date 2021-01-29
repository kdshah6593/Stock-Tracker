class WatchlistsController < ApplicationController

    def index #takes in current user and pulls up all his watchlists
        @user = current_user
        @watchlists = @user.watchlists
    end

    def new
        @watchlist = Watchlist.new
    end

    def create
        @watchlist = Watchlist.new(watchlist_params)
        @watchlist.user = current_user
        @watchlist.save
        redirect_to watchlist_path(@watchlist)
    end

    def show 
        @watchlist = Watchlist.find_by(params[:id])
    end

    def edit
        @watchlist = Watchlist.find_by(params[:id])
    end

    def update
        @watchlist = Watchlist.find_by(params[:id])
    end

    def destroy 
    end

    private
    def watchlist_params
        params.require(:watchlist).permit(:title)
    end

end
