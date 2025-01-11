# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :likes, only: [:create, :destroy]
  resources :tweets do
    resources :comments, only: [:create, :destroy]
    resource :like, only: [:create, :destroy]
    # resources :likes, only: [:create, :destroy], defaults: { likable: 'Tweet' }
  end
  # resources :comments do
  #   resources :likes, only: [:create, :destroy]
  # end

  resource  :user_profiles, only: %i[edit update]
  resources :tweets
  resources :comments, only: [:create, :destroy]

  root to: 'home#index'
end
