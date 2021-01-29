class Portfolio < ApplicationRecord
    belongs_to :user
    has_many :stock_purchases
    has_many :stocks, through: :stock_purchases
end
