class WatchlistsController < ApplicationController

    def index #takes in current user and pulls up all his watchlists
        @user = current_user
        @watchlists = @user.watchlists
    end

    def new
        @watchlist = current_user.watchlists.build
    end

    def create
        @watchlist = Watchlist.new(watchlist_params)
        @watchlist.user = current_user
        @watchlist.save
        redirect_to user_watchlist_path(current_user, @watchlist)
    end

    def show 
        @watchlist = Watchlist.find_by(params[:id])
    end

    def edit
        @watchlist = Watchlist.find_by(params[:id])
    end

    def update
        @watchlist = Watchlist.find_by(params[:id])
        @watchlist.update(watchlist_params)
        redirect_to user_watchlist_path(current_user, @watchlist)
    end

    def destroy 
    end

    private
    def watchlist_params
        params.require(:watchlist).permit(:title)
    end

end
