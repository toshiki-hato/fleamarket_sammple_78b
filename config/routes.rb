Rails.application.routes.draw do
  get 'purchase/index'
  get 'purchase/done'
  devise_for :users
  root to: 'products#index'
  get '/users/logout', to: 'users#logout'
  resources :users, only: [:edit, :update, :index, :show] do
    resources :credit_card, only: :new
  end
  resources :products do
    collection do
      get 'buy'
      post 'pay'
      get 'done'
    end
  end
  resources :credit_card, only: [:new, :show] do
    collection do
      post 'show', to: 'credit_card#show'
      post 'pay', to: 'credit_card#pay'
      post 'delete', to: 'credit_card#delete'
    end
  end
  
end
