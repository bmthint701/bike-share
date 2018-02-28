Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get 'users/view/:id', to: 'pages#show', as: 'show_user'
  get "search", to: "listings#search"
  get 'my_listings', to: 'listings#my_listings'
  resources :listings do
    get "book/review", to: 'bookings#review'
  end
end
