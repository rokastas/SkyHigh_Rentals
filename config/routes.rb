Rails.application.routes.draw do
  # get 'dashboards/user_dashboard' TODO: remove
  # get 'dashboards/owner_dashboard' TODO: remove
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "drones#index"

  # Defines the routes for the drones resource
  resources :drones, only: [:index, :show] do
    resources :bookings, only: [:new, :create]
  end
  # get '/dashboard', to: 'dashboards#dashboard', as: :dashboard TODO: remove

  resources :dashboards, only: [:index], path: "dashboard"

  resources :bookings, only: [:edit, :update, :destroy]

end
