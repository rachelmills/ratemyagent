Rails.application.routes.draw do
  root 'ratings#home'

  resources :agents
end
