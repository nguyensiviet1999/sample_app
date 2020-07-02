Rails.application.routes.draw do
  resources :users
  get "/signup", to: "users#new"
  get "/help", to: "static_pages#help", as: "helf"
  get "/about", to: "static_pages#about"
  get "static_pages/contact"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "static_pages#home"
  post "/signup", to: "users#create"
  resources :users
end
