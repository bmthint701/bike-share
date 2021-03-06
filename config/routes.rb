Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get 'users/view/:id', to: 'pages#show', as: 'show_user'
  get "search", to: "listings#search"
  get 'my_listings', to: 'listings#my_listings'
  resources :listings do
    resources :reviews, only: :create
  end
  get "book/review", to: 'bookings#review'
  post "book/create", to: 'bookings#create', as: 'bookings'
  get "book/confirm/:id", to: 'bookings#confirm', as: 'booking_confirm'
  get "book/index", to: "bookings#index", as: 'my_bookings'
  get "schedule/:id", to: 'listings#schedule', as: 'schedule'
  delete "book/:id", to: 'bookings#destroy'
  get "book/:id", to: 'bookings#show', as: 'booking'
  get 'my_requests', to: 'bookings#requests', as: 'requests'
  patch "my_requests/:id", to: "bookings#accept", as: 'accept_request'
end
