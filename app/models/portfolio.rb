class Portfolio < ApplicationRecord
    belongs_to :user
    has_many :stock_purchases
end
