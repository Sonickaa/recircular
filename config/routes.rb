Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "pages#home"

  get "category", to: "categories#index"
  get "category/new", to: "categories#new"
  post "category", to: "categories#create"

  get "user_category", to: "user_category#index"
  post "user_category", to: "user_category#create"
  delete "user_category/:id", to: "user_category#destroy"

  get "favorite", to: "favorites#index"
  post "favorite", to: "favorites#create"
  delete "favorite/:id", to: "favorites#destroy"

  get "want", to: "wants#index"
  post "want", to: "wants#create"
  delete "want/:id", to: "wants#destroy"

  get "chat", to: "chats#index"
  get "chat/:id", to: "chats#show"
  post "chat", to: "chats#create"
  delete "chat/:id", to: "chats#destroy"

  # get "user_profile", to: "user_profiles#index"
  # get "user_profile/:id", to: "user_profiles#show"
  # get "user_profile/new", to: "user_profiles#new"
  # post "user_profile", to: "user_profiles#create"
  # delete "user_profile/:id", to: "user_profiles#destroy"
  # patch "user_profile/:id", to: "user_profiles#update"

  resources :user_profiles, only: [:index, :show, :new, :create, :destroy, :update]

end
