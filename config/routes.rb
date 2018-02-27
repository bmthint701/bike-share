Rails.application.routes.draw do
  devise_for :users
  # do
  #   get 'users/sign_out' => 'devise/sessions#destroy'
  # end

  root to: 'pages#home'
  resources :listings
  get "search", to: "listings#search"
  get 'my_listings', to: 'listings#my_listings'

  get 'users/view/:id', to: 'pages#show', as: 'show_user'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
