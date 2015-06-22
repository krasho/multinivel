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
    end
  end
end
