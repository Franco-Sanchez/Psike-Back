Rails.application.routes.draw do
  root 'health#index'

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post '/signup', to: 'users#create'

  resource :profile, controller: :users, except: :create do
    # resources :appointments, only: %i[index create]
  end

  resources :psychologists, only: %i[index show]

  resources :appointments, only: %i[index create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
