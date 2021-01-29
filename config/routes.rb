Rails.application.routes.draw do
  #users
  resources :users, except: [:index, :new, :show]
  get '/users/new', to: "users#new", as: "signup"

  #portfolios & watchlists
  resources :users, only: [:show] do
    resources :portfolios
    resources :watchlists
  end

  #stocks
  resources :stocks, only: [:index, :show]

  get '/watchlists/:watchlist_id/stocks/new', to: 'stocks#new', as: 'add_stock'
  post '/watchlists/:watchlist_id/stocks', to: 'stocks#create', as: 'submit_stock'

  #stock_purchases
  resources :stock_purchases, only: [:new, :create, :destroy], path: 'portfolios/:portfolio_id'

  # get 'signup', to: 'users#new'

  # get 'login', to: 'sessions#new'
  # post 'login', to: 'sessions#create'
  # get 'logout', to: 'sessions#logout'
end
