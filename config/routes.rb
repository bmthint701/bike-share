Rails.application.routes.draw do
  devise_for :users

  root to: 'listings#search'
  resources :listings
  get 'my_listings', to: 'listings#my_listings'

  get 'users/:id', to: 'users#show', as: 'show_user'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
