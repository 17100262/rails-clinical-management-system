require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  resources :chats do
    # member do
      # get 'message'
      post 'messages'
    # end
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#home'
  get 'admin', to: 'home#admin', as: :admin
  put 'approve_user',to: 'users#approve_user', as: :approve_user
  # get 'users/profile/edit', to: 'users#edit_profile', as: :edit_profile
  resources :users do
    resources :notes, except:[:show,:edit,:destroy]
  end
  resources :notes, only: [:show,:edit,:destroy]
  # , path: '/users/profile'

end
