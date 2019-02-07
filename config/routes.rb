Rails.application.routes.draw do

  get '/static_pages/team', to: 'static_pages#team'
  get '/static_pages/contact', to: 'static_pages#contact'

  resources :gossips do
  end
  resources :users
  resources :cities

  resources :sessions, only: [:new, :create, :destroy]

  root 'gossips#index'
end
