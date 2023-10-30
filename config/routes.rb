Rails.application.routes.draw do
  resources :order_items
  resources :orders
  resources :categories
  resources :plants
  resources :users
  root to: 'home#index'

  get 'search', to: "search#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
