Rails.application.routes.draw do
  get 'services/new'
  get 'services/create'
  get 'services/edit'
  get 'services/update'
  get 'services/destroy'

  devise_for :users

  resources :profiles, only: %i[new create]


  resources :users, only: %i[destroy] do
    resources :services
  end

  resources :users, only: %i[show edit update] do
    resources :trips, except: %i[destroy]
  end

  resources :trips, only: %i[destroy] do
    resources :itineraries, only: %i[ new create update edit]
  end

  resources :itineraries, only: %i[destroy]

  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check


end
