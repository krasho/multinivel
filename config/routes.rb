Rails.application.routes.draw do

  devise_for :users

  post 'companies/supervisor', to: 'companies#supervisor'
  get 'companies/supervisor', to: 'companies#supervisor'

  resources :associates  
  #resources :banks
  resources :cities
  resources :commissions
  resources :commission_types
  resources :companies
  resources :payment_types
  resources :states

  get 'principals/index', to: 'principals#index'

  get 'site/:page' => 'site#pagina', as: :static_page

  root 'banks#index'

  #Ruta para el registro de un nuevo promotor
  get  'registro/new/:promotor' => 'site#registro'
  get  'site/:socio/acceso'    => 'site#acceso'
  post 'site/:socio/createUser'       => 'site#createUser'
  get  'site/:socio/confirmacion' => 'site#confirmacion'
  post 'registro/create'    => 'site#create'
  
end
