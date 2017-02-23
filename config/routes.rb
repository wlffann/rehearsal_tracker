Rails.application.routes.draw do
  root 'home#index'
  resources :users, only: [:show, :new, :create]
end
