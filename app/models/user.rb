class User < ApplicationRecord
    has_secure_password
    has_many :watchlists, dependent: :destroy
    has_many :portfolios, dependent: :destroy
    has_many :stock_purchases, through: :portfolios
    has_many :stocks, through: :stock_purchases
    validates :username, presence: true
    validates :username, uniqueness: true, on: :create
    validates :password, length: { in: 6..20 }
    validates :first_name, presence: true, on: :create
    validates :last_name, presence: true, on: :create
    validates :email, presence: true, on: :create
    validates :email, uniqueness: true, on: :create

    def portfolio_count
        self.portfolios.size
    end

    def watchlist_count
        self.watchlists.size
    end
end
