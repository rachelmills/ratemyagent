Rails.application.routes.draw do
  root 'ratings#home'

  resources :agents
  resources :ratings

  get 'signup', to: 'users#new'
  # post 'users', to: 'users#create'

  resources :users, except: [:new]
end
