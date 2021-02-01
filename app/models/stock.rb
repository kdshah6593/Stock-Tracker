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

    # This API limits requests to 5 per minute and 500 per day; need premium membership to accomodate more requests
    def stock_info
        response = HTTParty.get("https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=#{self.symbol}&apikey=#{ENV["STOCK_API_KEY"]}")
    end

    def stock_price
        stock_info["Global Quote"]["05. price"]
    end

    def stock_high
        stock_info["Global Quote"]["03. high"]
    end

    def stock_low
        stock_info["Global Quote"]["04. low"]
    end

    def stock_open
        stock_info["Global Quote"]["02. open"]
    end

    def stock_close
        stock_info["Global Quote"]["08. previous close"]
    end

    def stock_percent_change
        stock_info["Global Quote"]["10. change percent"]
    end
end
