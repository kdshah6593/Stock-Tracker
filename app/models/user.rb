class User < ApplicationRecord
    include ActiveModel::Validations
    has_secure_password

    has_many :watchlists, dependent: :destroy
    has_many :portfolios, dependent: :destroy
    has_many :stock_purchases, through: :portfolios
    has_many :stocks, through: :stock_purchases

    validates :username, presence: true
    validates :username, uniqueness: true, on: :create
    validates_with UsernameValidator
    validates :password, length: { in: 6..20 }, on: :create
    validates_with PasswordValidator, on: :create
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true
    validates_with EmailValidator

    def portfolio_count
        self.portfolios.size
    end

    def watchlist_count
        self.watchlists.size
    end
end
