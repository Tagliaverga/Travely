Rails.application.routes.draw do
  devise_for :users

  resources :profiles, only: %i[new create]

  resources :users, only: %i[destroy] do
    resources :services
  end

  resources :users, only: %i[show edit update]

  delete "trips/:trip_id/destroy", to: "trips#destroy", as: :trip_destroy

  resources :trips, except: %i[show destroy]

  resources :trips, only: %i[show] do
    resources :itineraries, only: %i[new create update edit]
  end

  resources :itineraries, only: %i[show] do
    resources :experiences, except: %i[index]
  end

  resources :itineraries, only: %i[destroy] do
    resources :documents, only: %i[create new index]
  end

  resources :documents, only: %i[destroy show]

  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check
end
