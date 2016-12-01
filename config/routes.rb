Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  resources :tasks
  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "vitrine/index"
  root :to => 'vitrine#index'
end
