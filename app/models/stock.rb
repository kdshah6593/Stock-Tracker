class Stock < ApplicationRecord
    has_many :stock_watchlists
    has_many :watchlists, through: :stock_watchlists
    has_many :stock_purchases
    has_many :portfolios, through: :stock_purchases

    def self.search(search)
        if search.blank?
            Stock.all
        else
            where('name LIKE ?', "%#{search}%")
        end
    end

    def self.sector(filter)
        if filter.blank?
            order("sector ASC").order("name ASC")
        else
            where('sector == ?', "#{filter}")
        end
    end

    def self.list_of_sectors
        distinct.pluck(:sector)
    end

    # This API limits requests to 5 per minute and 500 per day; need premium membership to accomodate more requests
    def stock_info
        info = {}
        response = HTTParty.get("https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=#{self.symbol}&apikey=#{ENV["STOCK_API_KEY"]}")
        info[:price] = response["Global Quote"]["05. price"]
        info[:open] = response["Global Quote"]["02. open"]
        info[:close] = response["Global Quote"]["08. previous close"]
        info[:percent_change] = response["Global Quote"]["10. percent change"]
        info
    end

    #This API has only monthly request limits
    def iex_stock_info
        info = {}
        response = HTTParty.get("https://cloud.iexapis.com/stable/stock/#{self.symbol.downcase}/quote?token=#{ENV["IEX_API_KEY"]}")
        info[:price] = response["latestPrice"].round(2)
        info[:open] = response["iexOpen"].round(2)
        info[:close] = response["iexClose"].round(2)
        info[:percent_change] = (response["changePercent"] * 100).round(2)
        info
    end
end
