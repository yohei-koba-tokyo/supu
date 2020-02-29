Rails.application.routes.draw do
  devise_for :users
  root 'missions#index'
  resources :users, only: [:index, :edit, :update]
  resources :friends
  resources :missions do
    resources :messages, only: [:create]
  end
end
