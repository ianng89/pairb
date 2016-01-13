Rails.application.routes.draw do
  resources :properties
  get 'home/index'

  get 'home/index'
root :to => 'home#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/signin' => 'sessions#new', :as => :signin
  # some other routes
  resources :users, only: [:new]
end