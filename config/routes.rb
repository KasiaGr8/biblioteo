Rails.application.routes.draw do
  get 'welcome/index'
  resources :sessions, only: [:new, :create]
  resource :sessions, only: [:destroy]
  resources :users, only: [:new, :create]
  resource :profile, only: [:show, :edit, :update] # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
