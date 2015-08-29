Rails.application.routes.draw do

  devise_for :users

  namespace :api do
    resources :sessions, only: [:create]
  end

  root to: 'api/pets#index'
end
