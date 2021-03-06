class Watchlist < ApplicationRecord
    belongs_to :user
    has_many :stock_watchlists, dependent: :destroy
    has_many :stocks, through: :stock_watchlists
    validates :title, presence: true
end
