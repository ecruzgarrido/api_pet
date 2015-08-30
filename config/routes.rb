Rails.application.routes.draw do

  devise_for :users

  namespace :api do
    resources :sessions, only: [:create]
    resources :pets, except: [:new, :edit]
  end

  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'api/pets#index'
end
