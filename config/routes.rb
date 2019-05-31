Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'dashboard', to: 'pages#dashboard', as: :dashboard
  resources :locations do
    resources :bookings, only: [:new, :create]
    resources :photos, only: [:new, :create, :destroy]
  end
  resources :bookings, only: [:show] do
    resources :reviews, only: [:create]
  end

end
