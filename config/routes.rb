Rails.application.routes.draw do
  devise_for :users
  root 'missions#index'
  resources :users, only: %i[index edit update] do
    member do
      get 'news'
    end
  end
  resources :friends
  resources :missions do
    resources :messages, only: %i[index create]
    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
  end
end
