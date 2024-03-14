Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tasks#index'
  
  get "login" => "session#new"
  post "login" => "session#create"
  get "logout" => "session#destroy"
  
  get "signup" => "users#new"
  
  resources :tasks
  
  resources :users, only: [:index, :show, :create]
  
  
  end
