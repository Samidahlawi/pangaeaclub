Rails.application.routes.draw do
  resources :participants
  resources :user_trips
  resources :itineraries
  resources :item_not_includeds
  resources :item_includeds
  resources :trips
  resources :guides
  root 'home#index'
  # routes for rails_admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # devise_for :users
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
