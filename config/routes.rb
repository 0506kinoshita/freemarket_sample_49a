Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'devise/registrations',
    sessions: 'devise/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  get 'users/show_item'=>'users#show_item'
  get 'users/:user_id/show_item'=>'users#show_item'
  get 'users/show_profile' => 'users#show_profile'


   devise_scope :user do
    get 'users/index', to: 'devise/registrations#index'
    get 'users/destroy', to: 'devise/sessions#destroy'
  end
  root 'items#index'
  resources :items
  resources :users, only: [:show, :edit, :update]
  resources :credit_card, only: [:new, :show] do
    collection do
      post 'show', to: 'credit_card#show'
      post 'pay', to: 'credit_card#pay'
      post 'delete', to: 'credit_card#delete'
    end
  end
 end
