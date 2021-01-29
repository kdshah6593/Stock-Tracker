class CreateStockPurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :stock_purchases do |t|

      t.timestamps
    end
  end
end
