Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
   devise_scope :user do
    get 'users/index', to: 'users/registrations#index'
  end 
  root 'items#index'
  resources :items 
end
