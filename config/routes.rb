Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  # some other routes
  resources :users, only: [:new]
end