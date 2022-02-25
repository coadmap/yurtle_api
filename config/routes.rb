# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tasks do
    post :complete, on: :member
  end
end
