Rails.application.routes.draw do
  # get '/', to: 'home#index'
  root 'home#index'

  resources :manufacturers, only: [:index, :show]
end
