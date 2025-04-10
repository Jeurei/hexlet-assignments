# frozen_string_literal: true

Rails.application.routes.draw do
  scope '/(:locale)', locale: /en|ru/ do
    root 'home#index'
    resources :posts do
      resources :comments, only: %i[new create edit update destroy], controller: 'posts/comments'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
