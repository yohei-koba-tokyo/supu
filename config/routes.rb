Rails.application.routes.draw do
  devise_for :users
  root 'friends#index'
  resources :users, only: [:index, :edit, :update]
  resources :missions
end
