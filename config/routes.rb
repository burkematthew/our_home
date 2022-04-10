# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :budgets
  resources :members
  resources :budget_categories
  namespace :event do
    resources :types
  end

  root to: "home#index"
end
