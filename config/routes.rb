Rails.application.routes.draw do
  resources :companies
  resources :clients do
    resources :insurances
  end

  devise_for :users
  resources :insurances, :only => [:index]

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end