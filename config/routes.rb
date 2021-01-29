Rails.application.routes.draw do
  #users
  resources :users, except: [:index, :new, :show]
  get '/signup', to: "users#new", as: "signup"

  #portfolios & watchlists
  resources :users, only: [:show] do
    resources :portfolios, except: [:show]
    resources :watchlists, except: [:show]
  end

  #stocks
  resources :stocks, only: [:index, :show]

  resources :watchlists, only: [:show] do
    resources :stocks, only: [:new, :create]
  end
  # get '/watchlists/:watchlist_id/stocks/new', to: 'stocks#new', as: 'add_stock'
  # post '/watchlists/:watchlist_id/stocks', to: 'stocks#create', as: ''

  #stock_purchases
  resources :portfolios, only: [:show] do
    resources :stock_purchases, only: [:new, :create, :delete]
  end

  # get 'signup', to: 'users#new'

  # get 'login', to: 'sessions#new'
  # post 'login', to: 'sessions#create'
  # get 'logout', to: 'sessions#logout'
end
