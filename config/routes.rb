Rails.application.routes.draw do
  devise_for :users

  root to: 'listings#search'
  resources :listings

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
