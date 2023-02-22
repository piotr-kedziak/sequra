Rails.application.routes.draw do
  resources :orders
  resources :shoppers
  resources :merchants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
