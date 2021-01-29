class CreateStockPurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :stock_purchases do |t|
      t.integer :amount
      t.float :cost
      t.integer :portfolio_id
      t.integer :stock_id
      t.timestamps
    end
  end
end
