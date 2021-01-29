class CreateStockWatchlists < ActiveRecord::Migration[6.1]
  def change
    create_table :stock_watchlists do |t|
      t.integer :stock_id
      t.integer :watchlist_id
      t.timestamps
    end
  end
end
