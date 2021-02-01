class WatchlistsController < ApplicationController

    def index #takes in current user and pulls up all his watchlists
        @user = current_user
        @watchlists = @user.watchlists
    end

    def new
        @watchlist = current_user.watchlists.build
    end

    def create
        @watchlist = current_user.watchlists.build(watchlist_params)
        if @watchlist.save
            redirect_to user_watchlist_path(current_user, @watchlist)
        else
            render :new
        end
    end

    def show 
        @watchlist = Watchlist.find_by(params[:id])
        @stock_watchlist = @watchlist.stock_watchlists.build
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
