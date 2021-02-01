class StocksController < ApplicationController

    def index
        @stocks = Stock.all
    end

    def show 
        @stock = Stock.find_by(id: params[:id])
    end

    def new #this is form to add a stock to watchlist

    end

    def create #this is to add a stock to watchlist
        
    end
end
