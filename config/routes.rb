# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tasks, except: :destroy do
    post :complete, on: :member
  end
end
