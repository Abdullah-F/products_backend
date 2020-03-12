Rails.application.routes.draw do
  post 'authenticate', to: 'authentications#authenticate'
  resources :users, only: [:new, :create]
  resources :products, only: [:index]
  resources :promotions, only: [:index]
end
