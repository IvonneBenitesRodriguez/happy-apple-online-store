Rails.application.routes.draw do
  get "dashboard/index"
  resource :session
  resources :passwords, param: :token
  resources :registrations, only: [:new, :create]

  root "dashboard#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
