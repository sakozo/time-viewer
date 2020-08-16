Rails.application.routes.draw do
  devise_for :users
  resources :users #do
    # member do
    #   post :date
    # end
  #end
  resources :own_times, only: [:create]
  resources :result_times, only: [:create]
  resources :projects, only: [:create, :update]
  resources :settings, only: [:index]
  resources :user_colors, only: [:create, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
