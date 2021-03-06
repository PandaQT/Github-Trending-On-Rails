Rails.application.routes.draw do
  
  root    'home#index'
  get     '/signup',      to: 'users#new'
  get     '/login',       to: 'sessions#new'
  post    '/login',       to: 'sessions#create'
  delete  '/logout',      to: 'sessions#destroy'
  get     '/trending',    to: 'trending#show'

  resources :users
end
