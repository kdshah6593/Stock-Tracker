class CreateWatchlistsStocks < ActiveRecord::Migration[6.1]
  def change
    create_join_table :watchlists, :stocks
  end
end
