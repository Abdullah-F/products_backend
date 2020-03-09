Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'
  resources :items, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
