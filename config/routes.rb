Rails.application.routes.draw do
  get "products/index"
  get "products/show"
  get "dashboard/index"
  resource :session
  resources :passwords, param: :token
  resources :registrations, only: [:new, :create]
  resources :products, only: [:index, :show]

  root "dashboard#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
