Rails.application.routes.draw do

  get 'sign_up' => 'users#new', as: 'sign_up'
  get 'sign_in' => 'sessions#new', as: 'sign_in'
  get 'sign_out' => 'sessions#destroy', as: 'sign_out'
  
  resources :posts, only: %i[index create]
  resources :users, only: %i[index create]
end
