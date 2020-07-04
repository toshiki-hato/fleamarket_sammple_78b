Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update, :index, :show]
  root to: 'products#index'
  
end
