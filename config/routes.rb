# frozen_string_literal: true

Rails.application.routes.draw do
  resources :teachers
  resources :courses, only: %i[index new create]

  root to: 'courses#index'
end
