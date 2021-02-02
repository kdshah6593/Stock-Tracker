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

    def self.sector
        order("sector ASC").order("name ASC")
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
end
