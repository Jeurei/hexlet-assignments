# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#index'

  resources :posts do
    resources :comments, controller: 'post_comments', shallow: true, except: %i[index show]
  end
end
