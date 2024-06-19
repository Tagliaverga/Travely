Rails.application.routes.draw do

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users

  resources :profiles, only: %i[new create]

  resources :users, only: %i[destroy] do
    resources :services
  end

  resources :users, only: %i[show edit update]

  resources :trips, except: %i[show destroy]

  get "trips/:id", to: "trips#show", as: :trip_show

  resources :trips, only: %i[destroy] do
    resources :itineraries, only: %i[new create update edit]
  end

  resources :itineraries, only: %i[show] do
    resources :experiences, except: %i[index]
  end

  resources :itineraries, only: %i[destroy] do
    resources :documents, only: %i[create new index]
  end

  resources :documents, only: %i[destroy show]

  resources :chatrooms, only: %i[show] do
    resources :messages, only: :create
  end

  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check
end
