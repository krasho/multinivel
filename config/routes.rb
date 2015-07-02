require 'api_constraints'

MultinivelApi::Application.routes.draw do
  mount SabisuRails::Engine => "/sabisu_rails"
# Api definition
  namespace :api, defaults: { format: :json },
                              constraints: { subdomain: 'api' }, path: '/'  do
    scope module: :v1,
              constraints: ApiConstraints.new(version: 1, default: true) do
      # We are going to list our resources here
      resources :banks
      mount_devise_token_auth_for 'User', at: '/auth'
    end
  end
end
