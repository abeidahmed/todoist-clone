Rails.application.routes.draw do
  root "static_pages#home"
  resources :users, only: %i[create]
  resources :sessions, only: %i[create]
end
