# Stock Tracker

# Description
User can keep track of their portfolios and create stock watchlists_path

# Models
- User (name, username, email, password)
- Portfolio (title, type of portfolio(roth, brokerage, 401k))
- Watchlist (title)
- Stocks (name, symbol, price)

# Associations
- User has many portfolios
- User has many watchlists 
- User has many stocks through portfolio
- Portfolio has many stocks through stock_quantity
- Portfolio belongs to User
- Watchlist has many stocks through watchlist_stocks
- Watchlist belongs to User
- Stock has many portfolios through stock_quantity
- Stock has many watchlists through watchlist_stocks

# Join Tables (one needs to take user attribute)
- watchlist_stocks (watchlist_id, stock_id)
- stock_quantity (amount, portfolio_id, stock_id)

# Controllers
- User -> Sign Up, Edit User Information
- Portfolio -> Edit
- Watchlist -> New watchlist, Edit watchlist, Index of watchlists
- Sessions -> Log In and Log out
- Stocks -> Index of Stocks, Show page of stocks
- ?Static -> maybe for home page
- Application - for helper methods or stuff

# Views
- User -> do a user profile(actual show) page (can show # of watchlists)
- Watchlist -> index, show, new, edit
- Portfolio -> edit

# Helpers
- current_user
- verified_user? authenticated

# Random Thoughts
- Portfolio types can be radio buttons
- Nest Portfolio and Watchlists under User
- OmniAuth: google 
- use validations for form fields
- use partials for forms
- use before_action / skip_before_action
