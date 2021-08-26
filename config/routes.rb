Rails.application.routes.draw do
  root 'products#index'

  get 'dashboard/index'
  get 'products/index'
  get 'products/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
