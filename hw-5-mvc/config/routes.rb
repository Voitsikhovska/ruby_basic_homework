# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :tweets do
    resources :comments
  end


  resource  :user_profiles, only: %i[edit update]
  resources :tweets


  root to: 'home#index'
end
