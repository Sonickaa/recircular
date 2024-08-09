Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "products#index"

  resources :products, only: [:index, :new, :create, :edit, :update]
  get "products/my_products", to: "products#my_products"
  get "products/user_products", to: "products#user_products"

  get "category", to: "categories#index"
  get "category/new", to: "categories#new"
  post "category", to: "categories#create"
end
