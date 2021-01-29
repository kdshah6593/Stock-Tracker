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

# Controller Actions
- If I don't nest portfolios under user, then I can nest stock purchases under portfolios which allows me to then get portfolio_id to use in hte stock purchase controller
    - or only nest portfolio index and show under Users
    - only nest watchlist index and show under Users
1. Watchlist
    - Index: see list of all watchlists
    - Show: see individual watchlist
    - New: form for new watchlist
    - Create: add new watchlist
    - Edit: form for editing watchlist
    - Update: update watchlist
    - Delete: delete watchlist
2. Portfolio
    - Index: see list of all portfolios
    - Show: see individual portfolio
    - New: form for new portfolio
    - Create: add new portfolio
    - Edit: form for editing portfolio
    - Update: update portfolio
    - Delete: delete portfolio
3. User
    - New: form to sign up new user
    - Create: sign up new user
    - Show: user home page with portfolio and watchlist info
    - Edit: form for editing user info
    - Update: update user info
    - Delete: delete user from system (add a check of are you sure?)
    - Additional Routes
        - Profile: shows profile with user info details
4. Stock
    - Index: see list of all stocks
    - Show: see individual stock
    - No conventional New/Create/Edit/Update/Delete 
        - New: Form to add stock to watchlist (relabel these in routes.rb)
        - Create: add stock to watchlist (relabel these in routes.rb)
5. StockPurchase
    - New: form to purchase/add stock to portfolio
    - Create: create a stock purchase andd add to portfolio
    - Edit/Update: MAYBE
    - Delete: remove a stock purchase

# Routes
- POST /users #create
- GET && PATCH && DELETE /users/:id #show #update #delete
- GET /users/new AS: signup #new
- GET /users/:id/edit #edit

- GET && POST /users/portfolios #index #create
- GET && PATCH && DELETE /users/:user_id/portfolios/:id #show #update #delete
- GET /users/:user_id/portfolios/new #new
- GET /users/:user_id/portfolios/:id/edit #edit

- GET && POST /users/watchlists #index #create
- GET && PATCH && DELETE /users/:user_id/watchlists/:id #show #update #delete
- GET /users/:user_id/watchlists/new #new
- GET /users/:user_id/watchlists/:id/edit #edit

- GET /stocks #index
- GET /stocks/:id #show

- GET /portfolios/:portfolio_id/stock_purchases/new #new
- POST /portfolios/:portfolio_id/stock_purchases #create
- DELETE /portfolios/:portfolio_id/stock_purchases/:id #delete

- GET /watchlists/:watchlist_id/stocks/new AS: add_stock #new
- POST /watchlists/:watchlist_id/stocks #create


# Helpers
- current_user, verified_user? authenticated ==> these will go in application controller
- View Helpers go in the helpers directory, these return snippets of HTML code; helps clean up views

# Portfolio View Page
- Use CSS to highlight if a stock is above or below what you bought it at (uses the cost attribute from stock purchase)
- add an organize stocks by alpahbet or highest price buttons (this can use the sequel functions like ORDER, WHERE, etc)

# Watchlist View Page
- add an organize stocks by alpahbet or highest price buttons (this can use the sequel functions like ORDER, WHERE, etc)

# Stock Index Page
- can add a SEARCH feature here

# Random Thoughts
- Check tables so numbers are float or integer as needed
- Portfolio types can be radio buttons
- Nest Portfolio and Watchlists under User
- OmniAuth: google 
- use validations for form fields --> remeber this gives you access to .errors on the model
- use partials for forms
- use before_action / skip_before_action
- need a changing navbar or sidebar
- only a user can change their own watchlists/portfolios
- need to figure out another way push stocks onto the watchlist model other than using <<
- instead of a separate form, can add new stock to watchlist inside watchlist show page using built in form in views page
    - also consider using search feature & collection select to create the drop down list to add to watchlist
    - in the form it may need to use watchlist_stock model instead of using stock model but we could use stock RESTful routes
    - then in the controller action we want to redirect to watchlist show page
- for any .save? checks, in the else statement, use render so then error can be seen


# Flow
1. User comes to home page, goes to a portfolio
2. Clicks Add Stock to Portfolio. Takes you to a NEW stock_purchase form
3. Fill out amount and cost, choose a stock from dropdown list or if you know symbol (add this functionality if time)
4. Upon submission, takes you controller action which makes new stock_purchase and then addes it into the portfolio
    - need to figure out how to carry the data so you know what portfolio it adds to, it will be a hidden field on the form

1. User comes to home page, goes to a watchlist
2. Clicks Add Stocks to Watchlist. Takes you to a form (nested under that watchlist)(the controller action should include using params for watchlist id from the previous link)
3. Form could allow adding multiple stocks via drop down list
4. Upon submission, adds the stocks to watchlist.stocks array then redirects you to watchlist show page
    - Figure out way to add a another field for a new stock drop down list for each time one is selected

# Future features
- Add a CASH attribute to Users - Stock purchases would then subtract from CASH value and user can add more cash to their account