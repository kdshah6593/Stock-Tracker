class StocksController < ApplicationController

    def index
        @stocks = Stock.all
    end

    def show 
    end
end
