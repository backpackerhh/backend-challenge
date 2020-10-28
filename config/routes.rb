# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :teachers

  resources :enrollments, only: %i[index new create]
  resources :teachers, only: %i[index] do
    member do
      post :vote
    end
  end
  resources :courses, only: %i[index new create] do
    member do
      post :vote
    end
  end

  root to: 'enrollments#index'
end
