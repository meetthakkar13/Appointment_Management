Rails.application.routes.draw do
  resources :appointments
  devise_for :users
  resources :profiles
  resources :users
  resources :roles

  root to: 'profiles#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
