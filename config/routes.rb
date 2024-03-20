Rails.application.routes.draw do
  
  root to: 'tasks#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :tasks, except: [:index]
  
  resources :users, only: [:index, :show, :create]
  
  
  end
