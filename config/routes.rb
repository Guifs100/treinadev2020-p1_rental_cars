Rails.application.routes.draw do
  # get '/', to: 'home#index'
  root 'home#index'

  resources :car_categories, only: [:index, :show]
  # resources :manufacturers, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :manufacturers

  # get '/rentals/serach', to: 'rental#search'
  resources :rentals, only: [] do

    get 'search', on: :collection
  end

  resources :customer, only: [] do

    get 'search', on: :collection
  end
end
