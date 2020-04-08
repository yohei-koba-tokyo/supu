Rails.application.routes.draw do
  devise_for :users
  root 'missions#index'
  resources :users, only: %i[index edit update]
  resources :friends
  resources :missions do
    resources :messages, only: %i[index create]
  end
end
