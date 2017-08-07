Rails.application.routes.draw do
  get 'users/new'

  get 'sessions/new'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
