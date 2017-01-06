Rails.application.routes.draw do
  get 'charges/create'

  resources :wikis

  get 'users/new'

  get 'users/show'

  get 'users/create'

  devise_for :users
  get 'welcome/index'

  get 'welcome/about'

  root "welcome#index"
end
