Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'devise/registrations',
    sessions: 'devise/sessions'
  }
   devise_scope :user do
    get 'users/index', to: 'devise/registrations#index'
    get 'users/destroy', to: 'devise/sessions#destroy'
  end 
  root 'items#index'
  resources :items 
  resources :users, only: [:show, :edit]
end
