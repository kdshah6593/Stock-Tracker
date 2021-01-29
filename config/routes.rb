Rails.application.routes.draw do
  #users
  resources :users, except: [:index, :new]
  get '/signup', to: "users#new", as: "signup"

  #portfolios
  resources :users do
    resources :portfolios
  end

  #watchlists
  resources :users do
    resources :watchlists
  end

  #stocks
  resources :stocks, only: [:index, :show]
  
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
