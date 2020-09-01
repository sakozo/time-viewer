Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  resources :users # do
  # member do
  #   post :date
  # end
  # end
  resources :own_times, only: [:create]
  resources :result_times, only: [:create]
  resources :projects, only: %i[create update]
  resources :settings, only: [:index]
  resources :user_colors, only: %i[create update]
  resources :charts, only: [:show]
  resources :diaries, only: [:create, :edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
