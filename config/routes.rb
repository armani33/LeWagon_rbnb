Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/about', to: 'pages#about', as: 'about'
  get '/contact', to: 'pages#contact', as: 'contact'
  get 'flats/search', to: 'flats#search', as: 'search'
  resources :flats do
    resources :bookings, only: [:new, :create, :destroy]
  end
  resources :users, only: [:show]
end
