Rails.application.routes.draw do
  devise_for :users
  root 'friends#index'
end
