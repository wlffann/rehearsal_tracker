Rails.application.routes.draw do
  root 'home#index'
  get '/auth/google_oauth2/callback', to: 'google_oauth_sessions#create'
  
  namespace :api do
    namespace :v1 do
      resources :rehearsals, only: [:update] do
        resources :notes, only: [:index, :create]
      end
    end
  end
  
  resources :users, only: [:show, :new, :create]
  
  resources :companies, only: [:new, :create] do
    resources :productions, only: [:new, :create] do
      resources :rehearsals, only: [:new, :create]
      resources :teams, only: [:new, :create]
    end
  end

  namespace :company, path: ':company_name' do
    get '/:production_title/teams/:id', to: 'teams#show', as: 'production_team'
    get '/:production_title/:id', to: 'rehearsals#show', as: 'production_rehearsal'
    patch '/:prouction_title/:id', to: 'rehearsals#update', as: 'production_rehearsal_update'
    get '/:production_title', to: 'productions#show', as: 'production'
  end
  
  get '/:company_name', to: 'companies#show', as: 'company'
end
