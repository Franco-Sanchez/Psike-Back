Rails.application.routes.draw do
  root 'health#index'

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post '/signup', to: 'users#create'

  resources :psychologists, only: %i[index show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
