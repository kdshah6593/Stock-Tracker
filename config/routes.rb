Rails.application.routes.draw do
  
  root "static#home"

  #users
  resources :users, except: [:index, :new, :show]
  get '/signup', to: "users#new", as: "signup"

  #portfolios & watchlists
  resources :users, only: [:show] do
    resources :portfolios
    resources :watchlists
    get '/profile', to: "users#profile"
  end

  #stocks
  get '/stocks/sector', to: 'stocks#sector'
  resources :stocks, only: [:index, :show]
  

  get '/watchlists/:watchlist_id/stocks/new', to: 'stocks#new', as: 'add_stock'
  post '/watchlists/:watchlist_id/stocks', to: 'stocks#create', as: 'submit_stock'
  delete '/watchlists/:watchlist_id/stocks/:id', to: 'stocks#destroy', as: "delete_stock"



  #stock_purchases
  resources :stock_purchases, only: [:new, :create, :destroy], path: 'portfolios/:portfolio_id/stockpurchases'

  #login/logout
  get '/login', to: 'sessions#new'
  post '/session', to: 'sessions#create', as: 'session'
  delete '/session', to: 'sessions#destroy', as: 'logout'
end
