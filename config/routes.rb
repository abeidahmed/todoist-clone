Rails.application.routes.draw do
  resources :users, only: %i[create]
  resources :sessions, only: %i[create]
end
