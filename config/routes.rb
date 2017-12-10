Rails.application.routes.draw do
  #devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  namespace :users do
    resources :profiles, only: [:show]
  end

  resources :growing_things do
    resources :days, only: [:show, :edit, :update, :new, :create]
  end
  #resources :users, :only => [:show] currenty want to figure out how to correctly namespace this user route
  resources :growing_things
  resources :days
  root 'users/profiles#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
