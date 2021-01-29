Rails.application.routes.draw do
  #users
  resources :users, except: [:index, :new, :show]
  get '/signup', to: "users#new", as: "signup"

  #portfolios & watchlists
  resources :users, only: [:show] do
    resources :portfolios
    resources :watchlists
  end

  #stocks
  resources :stocks, only: [:index, :show]
  resources :watchlists do
    resources :stocks, only: [:new, :create]
  end
  # get '/watchlists/:watchlist_id/stocks/new', to: 'stocks#new', as: 'add_stock'
  # post '/watchlists/:watchlist_id/stocks', to: 'stocks#create', as: ''

  #stock_purchases
  resources :portfolios do
    resources :stock_purchases, only: [:new, :create, :delete]
  end
  
  # resources
  #  :portfolios
  # resources :stock_purchases
  # resources :stocks, only: [:index, :show]
  # resources :watchlists

  # get 'signup', to: 'users#new'

  # get 'login', to: 'sessions#new'
  # post 'login', to: 'sessions#create'
  # get 'logout', to: 'sessions#logout'
end
