Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'devise/registrations',
    sessions: 'devise/sessions'
  }
  get 'users/show_item'=>'users#show_item'

   devise_scope :user do
    get 'users/index', to: 'devise/registrations#index'
    get 'users/destroy', to: 'devise/sessions#destroy'
    get 'users/logout', to: 'devise/sessions#logout'
  end
  root 'items#index'
  resources :items
  resources :users, only: [:show, :edit]
  resources :address, only: [:index, :create, :new]
  resources :credit_card, only: [:new, :show] do
    collection do
      post 'show', to: 'credit_card#show'
      post 'pay', to: 'credit_card#pay'
      post 'delete', to: 'credit_card#delete'
    end
  end
 end
