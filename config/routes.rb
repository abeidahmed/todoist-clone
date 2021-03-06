Rails.application.routes.draw do
  root "static_pages#home"
  resources :users, only: %i[new create]
  resources :sessions, only: %i[new create]

  namespace :app do
    resource :today, only: %i[show]
  end
end
