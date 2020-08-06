Rails.application.routes.draw do
  
  # get '/participants/:trip_id/new', to: 'participants#new', as: 'new_participant'
  resources :bookings
  resources :itineraries
  resources :trips do
    resources :participants
  end
  resources :item_not_includeds
  resources :item_includeds
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

  get '/about', to: 'home#show', as: 'show_home'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
