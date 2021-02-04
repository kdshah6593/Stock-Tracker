# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project 
    - Project built on Rails
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
    - User has many watchlists
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    - Watchlist belongs to User
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    - Portfolio has many stocks through stock_purchases; Watchlist has many stocks through stock_watchlists
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    - User has many stocks through stock_purchases, stocks has many users through stock purchases
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
    - Stock_purchase is a joins table between portfolio and stock that takes in user given values 
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    - sign up validates username, name, password, email; watchlists and portfolios require titles, etc
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    - search feature for stocks, use scope methods to filter stocks by sector
- [x] Include signup
    - signup route, signup form with new/create controller actions in user controller
- [x] Include login
    - login route, login form with actions in sessions controller
- [x] Include logout
    - logout route, actions in sessions controller
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
    - OmniAuth Github
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
    - portfolio and watchlists nested under user
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
    - portfolio and watchlists nested under user
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
    - both flash messaging and error messaging displays on views

Confirm:
- [x] The application is pretty DRY
    - moved repeating code into private methods
- [x] Limited logic in controllers
    - only conditional logic
- [x] Views use helper methods if appropriate
    - not used; used methods in app controller
- [x] Views use partials if appropriate
    - moved forms and tables into partials to clear up views pages