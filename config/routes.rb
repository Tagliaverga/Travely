Rails.application.routes.draw do

  devise_for :users

  resources :profiles, only: %i[new create]

  resources :users, only: %i[destroy] do
    resources :services
  end

  resources :users, only: %i[show edit update]

  resources :trips, except: %i[destroy]

  resources :trips, only: %i[destroy] do
    resources :itineraries, only: %i[new create update edit]
  end

  resources :itineraries, only: %i[show] do
    resources :experiences, except: %i[index]
  end

  resources :itineraries, only: %i[destroy] do
    resources :documents, except: %i[destroy]
  end


  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check


end
