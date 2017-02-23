Rails.application.routes.draw do
  root 'home#index'
  get '/auth/google_oauth2/callback', to: 'google_oauth_sessions#create'
  resources :users, only: [:show, :new, :create]
  resources :companies, only: [:show, :new, :create]
end
