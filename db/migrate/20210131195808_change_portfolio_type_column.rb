class ChangePortfolioTypeColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :portfolios, :type, :portfolio_type
  end
end
