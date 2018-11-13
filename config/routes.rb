Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'flats/search', to: 'flats#search', as: 'search'
  resources :flats do
    resources :bookings, only: [:new, :create, :destroy]
  end
  resources :users, only: [:show] do
    resources :bookings, only: [:index, :destroy]
  end
end
