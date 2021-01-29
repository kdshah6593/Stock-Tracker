Rails.application.routes.draw do
  
  root "static#home"

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

  get '/watchlists/:watchlist_id/stocks/new', to: 'stocks#new', as: 'add_stock'
  post '/watchlists/:watchlist_id/stocks', to: 'stocks#create', as: 'submit_stock'

  #stock_purchases
  resources :stock_purchases, only: [:new, :create, :destroy], path: 'portfolios/:portfolio_id'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
