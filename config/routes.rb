Rails.application.routes.draw do
  # get '/', to: 'home#index'
  root 'home#index'

  resources :car_categories, only: [:index]
  # resources :manufacturers, only: [:index, :show, :new, :create, :edit, :update, :delete]
  resources :manufacturers, only: [:index, :show, :new, :create, :edit, :update]
end
