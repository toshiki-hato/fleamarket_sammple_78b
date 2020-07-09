Rails.application.routes.draw do
  get 'purchase/index'
  get 'purchase/done'
  devise_for :users
  root to: 'products#index'
  get '/users/logout', to: 'users#logout'
  resources :users, only: [:edit, :update, :index, :show]
  resources :products do
    member do
      get 'buy'
      post 'pay'
      get 'done'
    end
  end
  resources :credit_card, only: [:show] do
    collection do
      post 'new', to: 'credit_card#new'
      post 'show', to: 'credit_card#show'
      post 'pay', to: 'credit_card#pay'
      post 'delete', to: 'credit_card#delete'
    end
  end
  
end
