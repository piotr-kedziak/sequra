Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :merchants, only: %i[index show]
    end
  end
  # resources :disbursements do
  #   resources :merchants
  # end

  # resources :orders
  # resources :shoppers
  # resources :merchants do
  #   # resources :disbursements
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
