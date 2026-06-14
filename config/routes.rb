Rails.application.routes.draw do
  get "cart_items/create"
  get "cart_items/destroy"
  get "products/index"
  get "products/show"
  get "dashboard/index"
  resource :session
  resources :passwords, param: :token
  resources :registrations, only: [:new, :create]
  resources :products, only: [:index, :show]
  resources :cart_items, only: [:create, :destroy]
  resource :cart, only: [:show]
  resources :orders, only: [:new, :create, :show]

  root "dashboard#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
