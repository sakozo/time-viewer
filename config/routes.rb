# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#          new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
#              user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
#      destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
#         new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
#        edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
#             user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
#                           PUT    /users/password(.:format)                                                                devise/passwords#update
#                           POST   /users/password(.:format)                                                                devise/passwords#create
#  cancel_user_registration GET    /users/cancel(.:format)                                                                  devise/registrations#cancel
#     new_user_registration GET    /users/sign_up(.:format)                                                                 devise/registrations#new
#    edit_user_registration GET    /users/edit(.:format)                                                                    devise/registrations#edit
#         user_registration PATCH  /users(.:format)                                                                         devise/registrations#update
#                           PUT    /users(.:format)                                                                         devise/registrations#update
#                           DELETE /users(.:format)                                                                         devise/registrations#destroy
#                           POST   /users(.:format)                                                                         devise/registrations#create
#                      root GET    /                                                                                        users#index
#                     users GET    /users(.:format)                                                                         users#index
#                           POST   /users(.:format)                                                                         users#create
#                  new_user GET    /users/new(.:format)                                                                     users#new
#                 edit_user GET    /users/:id/edit(.:format)                                                                users#edit
#                      user GET    /users/:id(.:format)                                                                     users#show
#                           PATCH  /users/:id(.:format)                                                                     users#update
#                           PUT    /users/:id(.:format)                                                                     users#update
#                           DELETE /users/:id(.:format)                                                                     users#destroy
#                 own_times POST   /own_times(.:format)                                                                     own_times#create
#              result_times POST   /result_times(.:format)                                                                  result_times#create
#                  projects POST   /projects(.:format)                                                                      projects#create
#                   project PATCH  /projects/:id(.:format)                                                                  projects#update
#                           PUT    /projects/:id(.:format)                                                                  projects#update
#                  settings GET    /settings(.:format)                                                                      settings#index
#               user_colors POST   /user_colors(.:format)                                                                   user_colors#create
#                user_color PATCH  /user_colors/:id(.:format)                                                               user_colors#update
#                           PUT    /user_colors/:id(.:format)                                                               user_colors#update
#                     chart GET    /charts/:id(.:format)                                                                    charts#show
#                   diaries POST   /diaries(.:format)                                                                       diaries#create
#                edit_diary GET    /diaries/:id/edit(.:format)                                                              diaries#edit
#                  messages POST   /messages(.:format)                                                                      messages#create
#                     rooms GET    /rooms(.:format)                                                                         rooms#index
#                           POST   /rooms(.:format)                                                                         rooms#create
#                      room GET    /rooms/:id(.:format)                                                                     rooms#show
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
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
  resources :diaries, only: %i[create edit]
  resources :messages, only: [:create]
  resources :rooms, only: %i[create show index]
  resources :tasks, only: %i[update show index]
  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
