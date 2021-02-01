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
end
