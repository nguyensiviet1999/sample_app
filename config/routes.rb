Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get "sessions/new"

  get "/signup", to: "users#new"
  get "/help", to: "static_pages#help", as: "helf"
  get "/about", to: "static_pages#about"
  get "static_pages/contact"

  root "static_pages#home"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
end
