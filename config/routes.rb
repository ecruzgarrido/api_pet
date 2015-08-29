Rails.application.routes.draw do

  devise_for :users

  namespace :api do
    resources :sessions, only: [:create]
    resources :pets, except: [:new, :edit]
  end

  root to: 'api/pets#index'
end
