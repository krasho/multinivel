require 'api_constraints'

MultinivelApi::Application.routes.draw do
  devise_for :users
  mount SabisuRails::Engine => "/sabisu_rails"
# Api definition
  namespace :api, defaults: { format: :json },
                              constraints: { subdomain: 'api' }, path: '/'  do
    scope module: :v1,
              constraints: ApiConstraints.new(version: 1, default: true) do
      # We are going to list our resources here
      resources :banks

      resources :users, :only => [:show, :create, :update, :destroy]
      resources :sessions, :only => [:create, :destroy]

      get '/auth/:provider/callback', to: 'sessions#create'
    end
  end
end
