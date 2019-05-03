Rails.application.routes.draw do
  devise_for :users do
    collection do
      get :confirm
    end
  end
  root 'items#index'
  resources :items 
  resources :users, only: [:index,:show,:new] do
  collection do
    get :confirm
  end
  end
end
