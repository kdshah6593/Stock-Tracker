# Stock Tracker

# Description
User can keep track of their portfolios and create stock watchlists

# Models
- [x] User (name, username, email, password)
- [x] Portfolio (title, type of portfolio(roth, brokerage, 401k))
- [x] Watchlist (title, description?)
- [x] Stock (name, symbol, price) - this will be seeded by API; will not be manually creating any stocks

# Associations
- [x] User has many portfolios
- [x] User has many watchlists 
- User has many stocks through portfolio ??????
- [x] Portfolio has many stocks through stock_purchases
- [x] Portfolio belongs to User
- [x] Watchlist has many stocks through watchlist_stocks
- [x] Watchlist belongs to User
- [x] Stock has many portfolios through stock_purchases
- [x] Stock has many watchlists through watchlist_stocks

# Join Tables (one needs to take user attribute)
- [x] stock_watchlists (watchlist_id, stock_id)
- [x] stock_purchases (amount (integer), cost per stock (float), portfolio_id, stock_id)

# Controllers
- [x] User -> Sign Up, Edit User Information
- [x] Portfolio -> Edit
- [x] Watchlist -> New watchlist, Edit watchlist, Index of watchlists
- [x] Sessions -> Log In and Log out
- [x] Stocks -> Index of Stocks, Show page of stocks
- ?Static -> maybe for home page
- [x] Application - for helper methods or stuff, could do static#home instead here

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
    - [x] [x] Index: see list of all watchlists
    - [x] [x] Show: see individual watchlist
    - [x] [x] New: form for new watchlist
    - [x] [x] Create: add new watchlist
    - [x] [x] Edit: form for editing watchlist
    - [x] [x] Update: update watchlist
    - [x] [] Delete: delete watchlist
2. Portfolio
    - [x] [x] Index: see list of all portfolios
    - [x] [x] Show: see individual portfolio
    - [x] [x] New: form for new portfolio
    - [x] [x] Create: add new portfolio
    - [x] [x] Edit: form for editing portfolio
    - [x] [x] Update: update portfolio
    - [x] [] Delete: delete portfolio
3. User
    - [x] [x] New: form to sign up new user
    - [x] [x] Create: sign up new user
    - [x] [x] Show: user home page with portfolio and watchlist info
    - [x] [] Edit: form for editing user info
    - [x] [] Update: update user info
    - [x] [] Delete: delete user from system (add a check of are you sure?)
    - Additional Routes
        - [x] [] Profile: shows profile with user info details
4. Stock
    - [x] [x] Index: see list of all stocks
    - [x] [x] Show: see individual stock
    - No conventional New/Create/Edit/Update/Delete 
        - [x] [] New: Form to add stock to watchlist (relabel these in routes.rb)
        - [x] [] Create: add stock to watchlist (relabel these in routes.rb)
5. StockPurchase
    - [x] [] New: form to purchase/add stock to portfolio
    - [x] [] Create: create a stock purchase andd add to portfolio
    - [] [] Edit/Update: MAYBE
    - [x] [] Delete: remove a stock purchase

# Routes
- [x] POST /users #create
- [x] GET && PATCH && DELETE /users/:id #show #update #delete
- [x] GET /users/new AS: signup #new
- [x] GET /users/:id/edit #edit

- [x] GET && POST /users/:user_id/portfolios #index #create
- [x] GET && PATCH && DELETE /users/:user_id/portfolios/:id #show #update #delete
- [x] GET /users/:user_id/portfolios/new #new
- [x] GET /users/:user_id/portfolios/:id/edit #edit

- [x] GET && POST /users/:user_id/watchlists #index #create
- [x] GET && PATCH && DELETE /users/:user_id/watchlists/:id #show #update #delete
- [x] GET /users/:user_id/watchlists/new #new
- [x] GET /users/:user_id/watchlists/:id/edit #edit

- [x] GET /stocks #index
- [x] GET /stocks/:id #show

- [x] GET /portfolios/:portfolio_id/stock_purchases/new #new
- [x] POST /portfolios/:portfolio_id/stock_purchases #create
- [x] DELETE /portfolios/:portfolio_id/stock_purchases/:id #delete

- [x] GET /watchlists/:watchlist_id/stocks/new AS: add_stock #new
- [x] POST /watchlists/:watchlist_id/stocks #create


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
- [x] Portfolio types can be radio buttons
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



# Next Steps
1. Create Navbar x
2. User Signout x
3. Add before_action so only logged in user can do actions in site x
4. New WatchList Form x
5. New Portfolio Form x
6. Validations for Watchlist and Portfolio x
7. Stock Purchase Form
8. Add Stock Form in Watchlist Show page
