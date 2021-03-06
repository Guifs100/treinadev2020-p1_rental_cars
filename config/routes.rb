Rails.application.routes.draw do
  devise_for :users
  # get '/', to: 'home#index'
  root 'home#index'

  resources :car_categories, only: [:index, :show]
  # resources :manufacturers, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :manufacturers
  resources :car_models, only: [:index, :show, :new, :create]

  # get '/rentals/serach', to: 'rental#search'
  resources :rentals, only: %i[index show new create] do
    get 'search', on: :collection
    resources :car_rentals, only: [:new, :create]
    # get 'start', on: :member
    # post 'init', on: :member
  end

  resources :customers, only: %i[index show] do
    get 'search', on: :collection
  end
  
  resources :subsidiaries, only: [:index, :shoow, :new, :create, :edit, :update]
end
