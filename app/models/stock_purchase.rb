class StockPurchase < ApplicationRecord
    belongs_to :stock
    belongs_to :portfolio
    validates :amount, presence: true
    validates :cost, presence: true
end
