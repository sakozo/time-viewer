Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :own_times, only: [:create]
  resources :result_times, only: [:create]
  resources :projects, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
