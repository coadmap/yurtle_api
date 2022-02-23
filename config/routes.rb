# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :v1 do
    resources :tasks, except: :destroy do
      post :complete, on: :member
    end
  end
end
