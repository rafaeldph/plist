Rails.application.routes.draw do
  root 'products#index'

  get 'dashboard', to: 'dashboard#index'
  get 'products/:id', to: 'products#show', as: :products_details
  post 'products/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
