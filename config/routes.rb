Rails.application.routes.draw do
  resources :pages, except: [:show]
  get '/pages/:permalink' => 'pages#permalink', as: 'permalink'
  resources :order_items
  resources :orders
  resources :categories
  resources :plants
  resources :users
  root to: 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
