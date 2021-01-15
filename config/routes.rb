Rails.application.routes.draw do
  resources :stocks, only: [:index, :show]
  resources :watchlists
  resources :users, only: [:create]
  get 'signup', to: 'users#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
