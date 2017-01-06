Rails.application.routes.draw do
  root 'ratings#home'

  resources :agents

  resources :agents do
    resources :ratings, shallow: true
  end

  get 'ratings', to: 'ratings#index', as: :ratings

  get 'signup', to: 'users#new'
  # post 'users', to: 'users#create'

  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
