Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  get '/users/logout', to: 'users#logout'
  resources :users, only: [:edit, :update, :index, :show] do
    resources :credit_card, only: :new
  end
  resources :products do
    collection do
      get :buy
    end
  end
end
