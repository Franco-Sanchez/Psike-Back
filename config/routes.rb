Rails.application.routes.draw do
  namespace :admin do
    # resources :people, only: %i[index show new create edit update destroy]
    resources :users, only: %i[index show edit update destroy] # new create
    resources :psychologists, only: %i[index show new create edit update destroy]
    resources :appointments, only: %i[index show new create edit update destroy]
    resources :patients, only: %i[index show new create edit update destroy]
    resources :comments, only: %i[index show new create edit update destroy]
    resources :days, only: %i[index show new create edit update destroy]
    resources :diagnoses, only: %i[index show new create edit update destroy]
    resources :hours, only: %i[index show new create edit update destroy]
    resources :jobs, only: %i[index show new create edit update destroy]
    resources :rankings, only: %i[index show new create edit update destroy]
    resources :schedules, only: %i[index show new create edit update destroy]
    resources :specialties, only: %i[index show new create edit update destroy]
    resources :transfers, only: %i[index show new create edit update destroy]

    root 'users#index'
  end

  root 'health#index'

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post '/signup', to: 'users#create'

  resource :profile, controller: :users, except: :create

  resources :psychologists, only: %i[index show]

  resources :appointments, only: %i[index create]
end
