Rails.application.routes.draw do
  get 'private_wikis/index'

  get 'private_wikis/show'

  get 'private_wikis/create'

  get 'private_wikis/destroy'

  resources :charges, only: [:new, :create, :destroy]

  resources :wikis

  get 'users/new'

  get 'users/show'

  get 'users/create'

  devise_for :users
  get 'welcome/index'

  get 'welcome/about'

  root "welcome#index"
end
