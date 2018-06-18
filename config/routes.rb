Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  use_doorkeeper
  devise_for :accounts, class_name: 'Doctor'

  root 'pages#index'

  namespace :api do
    namespace :v1 do
      resources :news, only: [:index]
    end
  end
end
