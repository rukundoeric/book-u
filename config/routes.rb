Rails.application.routes.draw do

  root 'opinions#index'

  get 'sign_up' => 'users#new', as: 'sign_up'
  get 'sign_in' => 'sessions#new', as: 'sign_in'
  get 'sign_out' => 'sessions#destroy', as: 'sign_out'

  post 'follow' => 'followings#create', as: 'follow' 
  delete 'unfollow' => 'followings#destroy', as: 'unfollow' 
  
  resources :sessions, only: %i[new create destroy]
  resources :opinions, only: %i[index create]
  resources :users, only: %i[index new create show update]
  resources :notifications, only: %i[index create]
end
