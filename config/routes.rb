Rails.application.routes.draw do

  root to: 'users#new'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
  get '/followers', to: 'followers#index', as: :followers
end
