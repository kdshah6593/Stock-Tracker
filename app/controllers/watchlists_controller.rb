class WatchlistsController < ApplicationController
    before_action :watchlist_find, only: [:show, :edit, :update, :destroy]

    def index #takes in current user and pulls up all his watchlists
        @user = current_user
        @watchlists = @user.watchlists
    end

    def new
        @watchlist = Watchlist.new
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
        @stock_watchlist = @watchlist.stock_watchlists.build
    end

    def edit
    end

    def update
        @watchlist.update(watchlist_params)
        redirect_to user_watchlist_path(current_user, @watchlist)
    end

    def destroy
        @watchlist.delete
        redirect_to user_watchlists_path(current_user)
    end

    private
    def watchlist_params
        params.require(:watchlist).permit(:title)
    end

    def watchlist_find
        @watchlist = Watchlist.find_by(id: params[:id])
    end

end
