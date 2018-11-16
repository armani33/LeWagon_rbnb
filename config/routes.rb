Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/about', to: 'pages#about', as: 'about'
  get '/contact', to: 'pages#contact', as: 'contact'
  get 'flats/search', to: 'flats#search', as: 'search'
  get 'flats/flats_user_index', to: "flats#flats_user_index", as: 'flats_user_index'
  get 'users/dashboard', to: 'dashboard#show', as: 'dashboard'
  get 'users/:user_id/flats/:flat_id/bookings', to: 'flats#owner_flat_bookings', as: 'owner_flat_bookings'
  resources :flats do
    resources :bookings, only: [:new, :create, :destroy]
  end
  resources :bookings, only: [:index, :update, :destroy]
end
