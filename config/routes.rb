Rails.application.routes.draw do

#root 'static_pages#home'
#get 'home' to: 'static_pages'

  #get '/static_pages/welcome', to: 'static_pages#welcome'
  #get '/static_pages/welcome/:id', to: 'static_pages#welcome'
  get '/static_pages/team', to: 'static_pages#team'
  get '/static_pages/contact', to: 'static_pages#contact'
  #get '/static_pages/gossipdetails/:id', to: 'static_pages#gossipdetails'
  #get '/static_pages/authordetails/:id', to: 'static_pages#authordetails'



  resources :cities
  resources :users

  root 'users#index'
  resources :gossips
  root 'gossips#index'
end
