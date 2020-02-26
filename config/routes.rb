Rails.application.routes.draw do
  devise_for :users
  root 'missions#index'
  resources :users, only: [:index, :edit, :update]
  resources :missions
  resources :friends
end
