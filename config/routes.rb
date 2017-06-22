Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :cities
  resources :orders
  resources :customers
  resources :suppliers
  # resources :sessions, only: [:create, :destroy]

  root  'customers#index'
  match '/login', to: 'sessions#new', via: 'get'
  match '/login', to: 'sessions#create', via: 'post'
  match '/logout', to: 'sessions#destroy', via: 'delete'

  match '/signup', to: 'customers#new', via: 'get'
  match '/signup', to: 'customers#create', via: 'post'

  match '/customers', to: 'customers#index', via: 'get'
  match '/customer', to: 'customers#show', via: 'get'
  match '/customers', to: 'customers#destroy', via: 'delete'
end


