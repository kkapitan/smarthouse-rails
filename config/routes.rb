require 'api_constraints'

Rails.application.routes.draw do

  devise_for :users
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users, :only => [:show, :create]
      resources :sessions, :only => [:create]
      resources :action_subjects, :only => [:index]
      resources :actions, :only => [:index, :create]

      delete '/sessions/logout', to: 'sessions#destroy'
    end
  end
end
