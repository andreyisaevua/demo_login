Rails.application.routes.draw do

  root 'notes#index'

  match '/register', to: 'users#new', via: 'get'
  match '/register', to: 'users#create', via: 'post'
  match '/login', to: 'sessions#new', via: 'get'
  match '/login', to: 'sessions#create', via: 'post'
  match '/logout', to: 'sessions#destroy', via: 'get'

  resources :notes, only: [:create, :destroy]

  match '/notes', to: 'notes#index', via: 'get'

end
