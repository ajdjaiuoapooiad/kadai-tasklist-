Rails.application.routes.draw do
  get 'toppage/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'toppage#index'
  
  
  get "signup" => "users#new"
  
  resources :tasks
  
  resources :users, only: [:index, :show, :create]
  
  
  end
