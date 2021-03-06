Rails.application.routes.draw do
  root to: 'users#new'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
  get '/followers', to: 'followers#index', as: :followers
  get '/following', to: 'following#index', as: :following
  get '/repos', to: 'repos#index', as: :repos
  get '/orgs', to: 'organizations#index', as: :organizations
  get '/activity', to: 'activity#index', as: :activity
  get '/following_activity', to: 'following_activity#index', as: :following_activity
end
