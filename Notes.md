# Stock Tracker

# Description
User can keep track of their portfolios and create stock watchlists

# Models
- User (name, username, email, password)
- Portfolio (title, type of portfolio(roth, brokerage, 401k))
- Watchlist (title, description?)
- Stocks (name, symbol, price) - this will be seeded by API; will not be manually creating any stocks

# Associations
- User has many portfolios
- User has many watchlists 
- User has many stocks through portfolio ??????
- Portfolio has many stocks through stock_purchases
- Portfolio belongs to User
- Watchlist has many stocks through watchlist_stocks
- Watchlist belongs to User
- Stock has many portfolios through stock_purchases
- Stock has many watchlists through watchlist_stocks

# Join Tables (one needs to take user attribute)
- watchlist_stocks (watchlist_id, stock_id)
- stock_purchases (amount (integer), cost per stock (float), portfolio_id, stock_id)

# Controllers
- User -> Sign Up, Edit User Information
- Portfolio -> Edit
- Watchlist -> New watchlist, Edit watchlist, Index of watchlists
- Sessions -> Log In and Log out
- Stocks -> Index of Stocks, Show page of stocks
- ?Static -> maybe for home page
- Application - for helper methods or stuff

# Views
- User -> user show page will show links to watchlist index and portfolio index, total value of portfolios, add watchlist or add portfolio links; do a user profile page (can see details of user with edit link)
- Watchlist -> index, show, new, edit
- Portfolio -> index, show, new, edit ; a portfolio will show the value of the portfolio, gain/loss (compared from cost of stock), list of stocks in portfolio, links to edit/delete portfolio or add stocks; portfolio index will list the user's portfolios, add portfolio link, edit portfolio link, delete portfolio link
- Stocks -> index, show (CANNOT ADD or EDIT stocks pulled from API)

# Helpers
- current_user
- verified_user? authenticated

# Random Thoughts
- Check tables so numbers are float or integer as needed
- Portfolio types can be radio buttons
- Nest Portfolio and Watchlists under User
- OmniAuth: google 
- use validations for form fields
- use partials for forms
- use before_action / skip_before_action
- need a changing navbar or sidebar
- only a user can change their own watchlists/portfolios