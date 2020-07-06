Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :users, only: [:edit, :update, :index, :show] do
    resources :credit_card, only: :new
  end
  resources :products
end
