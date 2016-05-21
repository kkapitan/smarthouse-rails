require 'api_constraints'

Rails.application.routes.draw do


  namespace :api, defaults: { format: :json }, path: '/api' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users, :only => [:show, :create]
      resources :sessions, :only => [:create]
      resources :action_subjects, :only => [:index]
      resources :actions, :only => [:index, :create, :destroy]

      delete '/sessions/logout', to: 'sessions#destroy'

      devise_for :users
    end
  end
end
